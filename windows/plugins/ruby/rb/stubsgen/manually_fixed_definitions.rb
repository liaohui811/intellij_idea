# author Roman.Chernyatchik

require "rdoc/known_classes"
require "set"

VALUE_UNKNOWN_COMMENT = "#value is unknown, used for indexing."
VALUE_UNKNOWN = "= nil #{VALUE_UNKNOWN_COMMENT}"
SEVERAL_VARIANTS = "(*several_variants)"

module Generators
    class RBGenerator
        # Hash map of manually patched global constants.
        # Format:
        #  key = "{file name}#{constant name}"
        #  value = ["comment", "default value with additional comment"]
        MANUALLY_PATCHED_CONSTANTS = {
                "object.rb#ARGF" => ["The alias to $<.", "= $< #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#ARGV" => ["The alias to $*.", "= $* #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#ENV" => ["A hash-like object containing current environment variables.", "= {} #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#DATA" => ["Contains lines following after __END__.", "= File.new #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#FALSE" => ["The alias to 'false'.", "= false"],
                "object.rb#NIL" => ["The alias to 'nil'.", "= nil"],
                "object.rb#RUBY_PLATFORM" => ["The identifier string of the current ruby platform. ", "= \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#RUBY_RELEASE_DATE" => ["The release date string of the current ruby platform. ", "= \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#RUBY_VERSION" => ["The version string of the ruby interpreter.", " = \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#RUBY_PATCHLEVEL" => ["The identifier string of the current ruby platform patch number.", " = \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#STDERR" => ["Current standard error output stream, $stderr be default", "= $stderr #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#STDIN" => ["Current standard input stream, $stdin be default.", "= $stdin #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#STDOUT" => ["Current standard output stream, $stdout be default.", "= $stdout"],
                "object.rb#TOPLEVEL_BINDING" => ["The top level binding object.", "= Binding.new #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#TRUE" => ["The alias to 'true'.", "= true"],

                "object.rb#VERSION" => ["Obsolete. Use RUBY_VERSION", "= \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#RELEASE_DATE" => ["Obsolete. Use RUBY_RELEASE_DATE", "= \"\" #{VALUE_UNKNOWN_COMMENT}"],
                "object.rb#PLATFORM" => ["Obsolete. Use RUBY_PLATFORM", "= \"\" #{VALUE_UNKNOWN_COMMENT}"]
        }

        SELF_BODY = "self"
        SELF_OR_NIL_BODY = "_ ? self : nil"
        MAP_BODY = "block_given? ? (yield to_enum.next).to_enum.to_a : to_enum"
        SELECT_BODY = "block_given? ? (yield to_enum.next; self) : to_enum"
        SELECT_BANG_BODY = "block_given? ? (yield to_enum.next; _ ? self : nil) : to_enum"
        FIND_BODY = "block_given? ? (yield to_enum.next; to_enum.next) : Enumerator.new"
        FIND_ALL_BODY = "yield to_enum.next; to_enum.next.to_a"
        EACH_BODY = "block_given? ? (yield to_enum.next; self) : to_enum"
        EACH_SLICE_BODY = "yield self; nil"
        EACH_VALUE_BODY = "yield self[__unknown]; self; "
        GET_ELEMENT_BODY = "_ ? to_enum.next : nil"
        GET_ELEMENT_OR_SELF_BODY = "if _; to_enum.next elsif _; self else nil end"
        SORT_BODY = "yield to_enum.next, to_enum.next; self"
        REPLACE_HASH_BODY = "other_hash"
        BOOLEAN_BODY = "yield to_enum.next; __unknown"
        CHUNK_BODY = "yield to_enum.next; []"
        CHUNK_WHILE_BODY = "x = to_enum; yield x.next, x.next; []"
        COUNT_BODY = "yield to_enum.next; 0"
        REDUCE_BODY="yield __unknown, to_enum.next"
        PERMUTATION_BODY = "block_given? ? (yield self; self) : to_enum.to_enum.to_a"
        INDEX_BODY = "block_given? ? (yield to_enum.next; _ ? 0 : nil) : to_enum"

        MANUALLY_ADDED_METHODS_BODIES = {
            # array.rb
            "array.rb#Array.+" => SELF_BODY,
            "array.rb#Array.-" => SELF_BODY,
            "array.rb#Array.*" => "_ ? self : ''",
            "array.rb#Array.&" => SELF_BODY,
            "array.rb#Array.|" => SELF_BODY,
            "array.rb#Array.<<" => SELF_BODY,
            "array.rb#Array.assoc" => GET_ELEMENT_BODY,
            "array.rb#Array.at" => GET_ELEMENT_BODY,
            "array.rb#Array.bsearch" => "block_given? ? (yield to_enum.next; _ ? to_enum.next : nil) : to_enum",
            "array.rb#Array.bsearch_index" => "yield to_enum.next; _ ? 0 : nil",
            "array.rb#Array.collect" => MAP_BODY,
            "array.rb#Array.collect!" => MAP_BODY,
            "array.rb#Array.combination" => PERMUTATION_BODY,
            "array.rb#Array.compact" => SELF_BODY,
            "array.rb#Array.compact!" => SELF_OR_NIL_BODY,
            "array.rb#Array.concat" => SELF_BODY,
            "array.rb#Array.cycle" => "block_given? ? (yield to_enum.next; nil) : to_enum",
            "array.rb#Array.delete" => "block_given? ? (_ ? to_enum.next : yield) : to_enum.next",
            "array.rb#Array.delete_at" => GET_ELEMENT_BODY,
            "array.rb#Array.delete_if" => SELECT_BODY,
            "array.rb#Array.difference" => SELF_BODY,
            "array.rb#Array.drop" => SELF_BODY,
            "array.rb#Array.drop_while" => SELECT_BODY,
            "array.rb#Array.each" => EACH_BODY,
            "array.rb#Array.each_index" => "block_given? ? (yield 0; self) : [0].to_enum",
            "array.rb#Array.fetch" => "block_given? ? (_ ? to_enum.next : yield 0) : to_enum.next",
            "array.rb#Array.find_index" => INDEX_BODY,
            "array.rb#Array.index" => INDEX_BODY,
            "array.rb#Array.initialize_copy" => "other_ary",
            "array.rb#Array.insert" => SELF_BODY,
            "array.rb#Array.intersection" => SELF_BODY,
            "array.rb#Array.filter" => SELECT_BODY,
            "array.rb#Array.filter!" => SELECT_BANG_BODY,
            "array.rb#Array.first" => GET_ELEMENT_BODY,
            "array.rb#Array.keep_if" => SELECT_BODY,
            "array.rb#Array.last" => GET_ELEMENT_BODY,
            "array.rb#Array.map" => MAP_BODY,
            "array.rb#Array.map!" => MAP_BODY,
            "array.rb#Array.max" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.min" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.minmax" => SORT_BODY,
            "array.rb#Array.permutation" => PERMUTATION_BODY,
            "array.rb#Array.pop" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.push" => SELF_BODY,
            "array.rb#Array.rassoc" => GET_ELEMENT_BODY,
            "array.rb#Array.reject" => SELECT_BODY,
            "array.rb#Array.reject!" => SELECT_BODY,
            "array.rb#Array.repeated_combination" => PERMUTATION_BODY,
            "array.rb#Array.repeated_permutation" => PERMUTATION_BODY,
            "array.rb#Array.replace" => "other_ary",
            "array.rb#Array.reverse" => SELF_BODY,
            "array.rb#Array.reverse!" => SELF_BODY,
            "array.rb#Array.reverse_each" => EACH_BODY,
            "array.rb#Array.rindex" => INDEX_BODY,
            "array.rb#Array.rotate" => SELF_BODY,
            "array.rb#Array.rotate!" => SELF_BODY,
            "array.rb#Array.sample" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.select" => SELECT_BODY,
            "array.rb#Array.select!" => SELECT_BANG_BODY,
            "array.rb#Array.shift" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.shuffle" => SELF_BODY,
            "array.rb#Array.shuffle!" => SELF_BODY,
            "array.rb#Array.size" => "0",
            "array.rb#Array.slice" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.slice!" => GET_ELEMENT_OR_SELF_BODY,
            "array.rb#Array.sort" => SORT_BODY,
            "array.rb#Array.sort!" => SORT_BODY,
            "array.rb#Array.sort_by!" => SELECT_BODY,
            "array.rb#Array.sum" => "yield to_enum.next; 0",
            "array.rb#Array.take" => SELF_BODY,
            "array.rb#Array.take_while" => SELECT_BODY,
            "array.rb#Array.to_a" => SELF_BODY,
            "array.rb#Array.transpose" => SELF_BODY,
            "array.rb#Array.union" => SELF_BODY,
            "array.rb#Array.uniq" => "yield to_enum.next; self",
            "array.rb#Array.uniq!" => "yield to_enum.next; _ ? self : nil",
            "array.rb#Array.unshift" => SELF_BODY,
            "array.rb#Array.values_at" => SELF_BODY,

            # enumerable.rb
            "enumerable.rb#Enumerable.all?" => BOOLEAN_BODY,
            "enumerable.rb#Enumerable.any?" => BOOLEAN_BODY,

            "enumerable.rb#Enumerable.chunk" => CHUNK_BODY,
            "enumerable.rb#Enumerable.slice_after" => CHUNK_BODY,
            "enumerable.rb#Enumerable.slice_before" => CHUNK_BODY,
            "enumerable.rb#Enumerable.slice_when" => CHUNK_WHILE_BODY,
            "enumerable.rb#Enumerable.chunk_while" => CHUNK_WHILE_BODY,

            "enumerable.rb#Enumerable.map" => MAP_BODY,
            "enumerable.rb#Enumerable.collect" => MAP_BODY,
            "enumerable.rb#Enumerable.collect_concat" => MAP_BODY,
            "enumerable.rb#Enumerable.flat_map" => MAP_BODY,

            "enumerable.rb#Enumerable.cycle" => EACH_BODY,
            "enumerable.rb#Enumerable.detect" => FIND_BODY,
            "enumerable.rb#Enumerable.drop" => SELF_BODY,
            "enumerable.rb#Enumerable.drop_while" => SELECT_BODY,

            "enumerable.rb#Enumerable.each_cons" => EACH_SLICE_BODY,
            "enumerable.rb#Enumerable.each_slice" => EACH_SLICE_BODY,

            "enumerable.rb#Enumerable.find" => FIND_BODY,
            "enumerable.rb#Enumerable.find_all" => FIND_ALL_BODY,

            "enumerable.rb#Enumerable.delete" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.delete_At" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.min" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.max" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.last" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.first" => GET_ELEMENT_BODY,
            "enumerable.rb#Enumerable.pop" => GET_ELEMENT_BODY,

            "enumerable.rb#Enumerable.grep" => SELECT_BODY,
            "enumerable.rb#Enumerable.grep_v" => SELECT_BODY,
            "enumerable.rb#Enumerable.select" => SELECT_BODY,
            "enumerable.rb#Enumerable.reject" => SELECT_BODY,
            "enumerable.rb#Enumerable.take" => SELECT_BODY,
            "enumerable.rb#Enumerable.take_while" => SELECT_BODY,

            "enumerable.rb#Enumerable.count" => COUNT_BODY,
            "enumerable.rb#Enumerable.find_index" => COUNT_BODY,
            "enumerable.rb#Enumerable.sum" => COUNT_BODY,

            "enumerable.rb#Enumerable.inject" => REDUCE_BODY,
            "enumerable.rb#Enumerable.reduce" => REDUCE_BODY,
            "enumerable.rb#Enumerable.uniq" => SELF_BODY,

            "enumerable.rb#Enumerable.reverse_each" => EACH_BODY,

            "enumerable.rb#Enumerable.sort" => SELF_BODY,
            "enumerable.rb#Enumerable.sort_by" => SELECT_BODY,

            # file.rb
            "file.rb#File.open" => "block_given? ? yield(new) : new",

            # hash.rb
            "hash.rb#Hash.replace" => REPLACE_HASH_BODY,

            "hash.rb#Hash.each" => EACH_VALUE_BODY,
            "hash.rb#Hash.each_value" => EACH_VALUE_BODY,
            "hash.rb#Hash.each_pair" => EACH_VALUE_BODY,

            "hash.rb#Hash.select" => SELECT_BODY,
            "hash.rb#Hash.select!" => SELECT_BODY,
            "hash.rb#Hash.keep_if" => SELECT_BODY,
            "hash.rb#Hash.delete_if" => SELECT_BODY,
            "hash.rb#Hash.reject" => SELECT_BODY,
            "hash.rb#Hash.reject!" => SELECT_BODY,

            "hash.rb#Hash.shift" => SELF_BODY,

            "hash.rb#Hash.delete" => GET_ELEMENT_BODY,

            # integer.rb
            "integer.rb#Integer.coerce" => "[0]",
            "integer.rb#Integer.digits" => "[0]",
            "integer.rb#Integer.downto" => "block_given? ? (yield self; self) : [0].to_enum",
            "integer.rb#Integer.gcdlcm" => "[0]",
            "integer.rb#Integer.modulo" => "other",
            "integer.rb#Integer.remainder" => "numeric",
            "integer.rb#Integer.times" => "block_given? ? (yield self; self) : [0].to_enum",
            "integer.rb#Integer.upto" => "block_given? ? (yield self; self) : [0].to_enum",

            # kernel.rb
            "kernel.rb#Kernel.global_variables" => "[:_]",
            "kernel.rb#Kernel.readlines" => "['']",
            "kernel.rb#Kernel.srand" => "0",

            # numeric.rb
            "numeric.rb#Numeric.clone" => SELF_BODY,
            "numeric.rb#Numeric.coerce" => "[0]",
            "numeric.rb#Numeric.divmod" => "[0]",
            "numeric.rb#Numeric.dup" => SELF_BODY,
            "numeric.rb#Numeric.i" => "Complex.new",
            "numeric.rb#Numeric.polar" => "[0]",
            "numeric.rb#Numeric.rect" => "[self, 0]",
            "numeric.rb#Numeric.rectangular" => "[self, 0]",

            # object.rb
            "object.rb#Object.clone" => SELF_BODY,
            "object.rb#Object.dup" => "self.class.new",
            "object.rb#Object.extend" => SELF_BODY,
            "object.rb#Object.instance_variables" => "[:_]",
            "object.rb#Object.itself" => SELF_BODY,
            "object.rb#Object.private_methods" => "[:_]",
            "object.rb#Object.protected_methods" => "[:_]",
            "object.rb#Object.public_methods" => "[:_]",
            "object.rb#Object.singleton_methods" => "[:_]",
            "object.rb#Object.taint" => SELF_BODY,
            "object.rb#Object.tap" => "yield self; self",
            "object.rb#Object.then" => "yield self",
            "object.rb#Object.trust" => SELF_BODY,
            "object.rb#Object.untaint" => SELF_BODY,
            "object.rb#Object.untrust" => SELF_BODY,
            "object.rb#Object.yield_self" => "yield self",

            # object_space.rb
            "object_space.rb#ObjectSpace.each_object" => "block_given? ? 0 : Enumerator.new",

            # string.rb
            "string.rb#String.each_char" => EACH_BODY,
            "string.rb#String.each_line" => EACH_BODY,

            # symbol.rb
            "symbol.rb#Symbol.next" => SELF_BODY,
            "symbol.rb#Symbol.succ" => SELF_BODY,
        }

        # Hash map of manully patched SuperClasses Names.
        # Format:
        #  key = "{file name}#{class name}"
        #  value = "super class name"
        MANUALLY_PATCHED_SUPERCLASSES = {
                "file.rb#File" => "IO"
        }

        def get_method_body(file_name, constant_name, method_name)
            key = "#{file_name}##{constant_name}.#{method_name}"
            MANUALLY_ADDED_METHODS_BODIES[key]
        end

        def get_patched_constant_info(file_name, constant_name)
            MANUALLY_PATCHED_CONSTANTS["#{file_name}##{constant_name}"]
        end

        def get_patched_superclass_name(file_name, class_name)
            MANUALLY_PATCHED_SUPERCLASSES["#{file_name}##{class_name}"]
        end


        #Here key  is multiline call_seq
        MANUALLY_PATCHED_CALL_SEQ_MULTIDEF_VARIANTS = {
                "array[index]         = obj                     ->  obj\narray[start, length] = obj or an_array or nil  ->  obj or an_array or nil\narray[range]         = obj or an_array or nil  ->  obj or an_array or nil" => SEVERAL_VARIANTS,
                "IO.select(read_array \n[, write_array \n[, error_array \n[, timeout]]] ) =>  array  or  nil" => "(read_array, *write_error_arrays_timeout)",
                "str[fixnum] = fixnum\nstr[fixnum] = new_str\nstr[fixnum, fixnum] = new_str\nstr[range] = aString\nstr[regexp] = new_str\nstr[regexp, fixnum] = new_str\nstr[other_str] = new_str" => SEVERAL_VARIANTS,
        }

        #Here key = {method_name}.{one_call_seq_def}
        MANUALLY_PATCHED_CALL_SEQ_SINGLEDEF_VARIANTS = {
                "catch.catch(symbol) {| | block }  > obj" => "(symbol)",

             #file.rb
                "fnmatch.File.fnmatch( pattern, path, [flags] ) => (true or false)" => "(pattern, path, *flags)",
                "fnmatch?.File.fnmatch?( pattern, path, [flags] ) => (true or false)" => "(pattern, path, *flags)",
                "lchown.file.lchown(owner_int, group_int, file_name,..) => integer" => "(owner_int, group_int, file_name, *smth)",

                "expand_path.File.expand_path(file_name [, dir_string] ) -> abs_file_name" => "(file_name, *dir_string)",
                "basename.File.basename(file_name [, suffix] ) -> base_name" => "(file_name, *suffix)",
             #nomethoderror.rb
                "new.NoMethodError.new(msg, name [, args])  => no_method_error" => "(msg, name, *args)",

             #regexp.rb
                "union.Regexp.union([pattern]*)   => new_str" => "(*patterns)",

             #marshal.rb
                "load.load( source [, proc] ) => obj" => "(source, *proc)",
                "restore.restore( source [, proc] ) => obj" => "(source, *proc)",

             #method.rb
                "[].meth[args, ...]         => obj" => "(args, *smth)",

             #time.rb
                "now.Time.new -> time" => "()",
                "utc.Time.utc( year [, month, day, hour, min, sec, usec] ) => time" => SEVERAL_VARIANTS,
                "gm.Time.gm( year [, month, day, hour, min, sec, usec] ) => time" => SEVERAL_VARIANTS,
                "local.Time.local( year [, month, day, hour, min, sec, usec] ) => time" => SEVERAL_VARIANTS,

             #win32ole_type.rb
                "ole_methods.WIN32OLE_TYPE#ole_methods # the array of WIN32OLE_METHOD objects." => "()",

             #mathcdata.rb
                "select.mtch.select([index]*)   => array" => "(*index)",

             #hash.rb
                "[].Hash[ [key =>|, value]* ]   => hash" => "(*key_value)",

             #win32ole.rb
                "new.WIN32OLE.new(server, [host]) -> WIN32OLE object" => "(server, *host)",
                "ole_show_help.WIN32OLE.ole_show_help(obj [,helpcontext])" => "(obj, *helpcontext)",
                "method_missing.WIN32OLE#method_missing(id [,arg1, arg2, ...])" => "(id, *args)",
                "setproperty.WIN32OLE.setproperty('property', [arg1, arg2,...] val)" => "(property, *args)",
                "[]=.WIN32OLE['property']=val" => "(property_name, val)",
                "invoke.WIN32OLE#invoke(method, [arg1,...])  => return value of method." => "(method, *args)",
                "[].WIN32OLE['property']" => "(property_name)",
                "WIN32OLE['property']=val" => "(property_name)",
                "codepage=.WIN32OLE.codepage = CP" => "(code_page)",

             #win32ole_event.rb
                "on_event.WIN32OLE_EVENT#on_event([event]){...}" => "(*event)",
                "on_event_with_outargs.WIN32OLE_EVENT#on_event_with_outargs([event]){...}" => "(*event)",

             #nameerror.rb
                "new.NameError.new(msg [, name])  => name_error" => "(msg, *name)",
             #continuation.rb
                "[].cont[args, ...]" => "(args, *smth)",

             #proc.rb
                "call.prc.call(params,...)      => obj" => "(*params)",
                "[].prc[params,...]        => obj" => "(*params)",
                "call.prc.call(params,...)   -> obj" => "(*params)",
                "[].prc[params,...]        -> obj" => "(*params)",
             #dir.rb
                "mkdir.Dir.mkdir( string [, integer] ) => 0" => "(string, *permissions_int)",
             #io.rb
                "sysopen.IO.sysopen(path, [mode, [perm]])  => fixnum" => "(path, *mode_perm)",
                "read.IO.read(name, [length [, offset]] )   => string" => "(name, *length_offset)",
                "printf.ios.printf(format_string [, obj, ...] )   => nil" => "(format_string, *objects)",
                "read.ios.read([length [, buffer]])    => string, buffer, or nil" => "(*args)",
                "puts.ios.puts(obj, ...)    => nil" => "(obj='', *arg)",

             #string.rb
                "split.str.split(pattern=$;, [limit])   => anArray" => "(pattern=$;, *limit)",
                "delete.str.delete([other_str]+)   => new_str" => "(*other_strings)",
                "delete!.str.delete!([other_str]+>)   => str or nil" => "(*other_strings)",
                "squeeze.str.squeeze([other_str]*)    => new_str" => "(*other_strings)",
                "squeeze!.str.squeeze!([other_str]*)   => str or nil" => "(*other_strings)",
                "count.str.count([other_str]+)   => fixnum" => "(*other_strings)",
                "center.str.center(integer, padstr)   => new_str" => "(integer, padstr=\"\")",

             #zlib.rb
                "deflate.deflate(string[, flush])" => "(string, *flush)",
                "new.Zlib::Inflate.new(window_bits)" => "(window_bits = nil)",
                "adler32.Zlib.adler32(string, adler)" => "(string = nil, adler = nil)",
                "crc32.Zlib.crc32(string, adler)" => "(string = nil, adler = nil)",

             #kernel.rb
                "eval.eval(string [, binding [, filename [,lineno]]])  => obj" => "(string, *binding_filename_lineno)",
                "method_missing.obj.method_missing(symbol [, *args] )   => result" => "(symbol, *args)",
                "throw.throw(symbol [, obj])" => "(symbol, *obj)",
                "untrace_var.untrace_var(symbol [, cmd] )   => array or nil" => "(symbol, *cmd)",
                "test.test(int_cmd, file1 [, file2] ) => obj" => "(int_cmd, file1, *file2)",
                "syscall.syscall(fixnum [, args...])   => integer" => "(fixnum, *args)",
                "format.format(format_string [, arguments...] )   => string" => "(format_string, *args)",
                "sprintf.sprintf(format_string [, arguments...] )  => string" => "(format_string, *args)",
                "exec.exec(command [, arg, ...])" => "(command, *arg)",
                "system.system(cmd [, arg, ...])    => true or false" => "(cmd, *arg)",
                "sleep.sleep([duration])    => fixnum" => "(*duration)",
                "split.split([pattern [, limit]])    => array" => "*pattern_limit",
                "select.IO.select(read_array\n[, write_array\n[, error_array\n[, timeout]]] ) =>  array  or  nil" => "(*args)",
                "autoload.autoload(module, filename)   => nil" => "(module1, filename)",
                "include?.mod.include?(module)    => true or false" => "(module1)",
                "p(obj, ...)    => nil" => "(*arg)",
                "puts(obj, *smth)" => "(obj='', *arg)",
                "puts.puts(obj, ...)    => nil" => "(obj='', *arg)",
                "abort.abort" => "(message='')",
                "abort.Kernel::abort([msg])" => "(message='')",
                "fork.Kernel.fork  [{ block }]   -> integer or nil" => "()",

             #object.rb
                "instance_of?.obj.instance_of?(class)    => true or false" => "(class1)",
                "kind_of?.obj.kind_of?(class)    => true or false" => "(class1)",
                "is_a?.obj.is_a?(class)       => true or false" => "(class1)",

             #objectspace.rb
                "define_finalizer.ObjectSpace.define_finalizer(obj, aProc=proc())" => "(obj, aProc=proc())",
                "each_object.ObjectSpace.each_object([module]) {|obj| ... } => fixnum" => "(*module1)",

             #array.rb
                "concat.ary.concat(other_ary1, other_ary2,...)   -> ary" => "(*other_arys)",
                "concat.ary.concat(other_ary1, other_ary2, ...)   -> ary" => "(*other_arys)",
                "indexes.array.indexes( i1, i2, ... iN )   -> an_array" => "(*i1_i2__in)",
                "indices.array.indices( i1, i2, ... iN )   -> an_array" => "(*i1_i2__in)",
                "insert.array.insert(index, obj...)  -> array" => "(index, *objects)",
                "intersection.ary.intersection(other_ary1, other_ary2, ...)      -> new_ary" => "(*other_arys)",
                "difference.ary.difference(other_ary1, other_ary2, ...)   -> ary" => "(*other_arys)",
                "difference.ary.difference(other_ary1, other_ary2, ...)   -> new_ary" => "(*other_arys)", # Ruby 2.7+
                "union.ary.union(other_ary1, other_ary2, ...)   -> ary" => "(*other_arys)",
                "union.ary.union(other_ary1, other_ary2, ...)   -> new_ary" => "(*other_arys)", # Ruby 2.7+
                "unshift.ary.unshift(obj, ...)  -> ary" => SEVERAL_VARIANTS,
                "values_at.ary.values_at(selector, ...)  -> new_ary" => SEVERAL_VARIANTS,

             #module.rb
                "include.include(module, ...)    => self" => "(module1, *smth)",
                "class_eval.mod.class_eval(string [, filename [, lineno]])  => obj" => "(string=nil, filename=nil, lineno=nil)",
                "module_eval.mod.module_eval {|| block }                     => obj" => "(string=nil, filename=nil, lineno=nil)",
                "module_function.module_function(symbol, ...)    -> self" => "(*args)",

             #stringio.rb
                "open.StringIO.open(string=\"\"[, mode]) {|strio| ...}" => "(string=\"\", *mode)",
                "new.StringIO.new(string=\"\"[, mode])" => "(string=\"\", *mode)",
                "read.strio.read([length [, buffer]])    -> string, buffer, or nil" => "(*args)",
                "sysread.strio.sysread(integer[, outbuf])    -> string" => "(integer, *outbuf)",
                "printf.strio.printf(format_string [, obj, ...] )   -> nil" => "(format_string, *objects)",
                "send.obj.send(symbol [, args...])        => obj" => "(symbol, *args)",
                "__send__.obj.__send__(symbol [, args...])    => obj" => "(symbol, *args)",
                "puts.strio.puts(obj, ...)    => nil" => "(obj='', *arg)",

             #object.rb
                "extend.obj.extend(module, ...)    => obj" => "(module1, *args)",

             #thread.rb
                "new.Thread.new([arg]*) {|args| block }   => thread" => "(*args)",
                "start.Thread.start([args]*) {|args| block }   => thread" => "(*args)",
                "fork.Thread.fork([args]*) {|args| block }    => thread" => "(*args)",
             #range.rb
                "new.Range.new(start, end, exclusive=false)    => range" => "(r_start, r_end, exclusive=false)",
             #time.rb
                "mktime.Time.mktime( year, month, day, hour, min, sec, usec )   => time" => "(year, *args)",
             #marshal.rb
                "dump.dump( obj [, anIO] , limit=--1 ) => anIO" => "(obj, anIO=IO, limit=--1)",
             #exception.rb
                "Exception.new(msg = nil)   =>  exception" => "(msg = nil, *args)",
             #method.rb
                "call.meth.call(args, ...)    => obj" => "(*args)",
                "[].meth.call(args, ...)    => obj" => "(*args)",
             #zlib.rb
                "deflate.Zlib::Deflate.deflate(string[, level])" => "(string, level=nil)",
             #big_decimal.rb
               "new.new(initial, digits)" => "(initial, digits=nil)",
             #big_decimal.rb
               "initialize.new(initial, digits)" => "(initial, digits=nil)",
             #class.rb
               "new.class.new(args, ...)    ->  obj" => "(*args)",
        }

        MANUALLY_PATCHED_FILE_NAMES = {
                "StringScanner" => "strscan",
                "StringIO" => "stringio"
        }
    end
end

RDoc::KNOWN_CLASSES["rb_eEncodingError"] = "EncodingError"
RDoc::KNOWN_CLASSES["ArgError"] = "ArgumentError"
RDoc::KNOWN_CLASSES["rb_cTCPSocket"] = "TCPSocket"
RDoc::KNOWN_CLASSES["rb_cIPSocket"]  = "IPSocket"
RDoc::KNOWN_CLASSES["rb_cBasicSocket"] = "BasicSocket"
RDoc::KNOWN_CLASSES["rb_cUNIXSocket"] = "UNIXSocket"
RDoc::KNOWN_CLASSES["cPKey"] = "PKey"
RDoc::KNOWN_CLASSES["ePKeyError"] = "PKeyError"
RDoc::KNOWN_CLASSES["eOSSLError"] = "OpenSSLError"
RDoc::KNOWN_CLASSES["mDigest"] = "Digest"
RDoc::KNOWN_CLASSES["cASN1ObjectId"] = "ASN1ObjectId"
RDoc::KNOWN_CLASSES["rb_mObjSpace"] = "ObjectSpace"