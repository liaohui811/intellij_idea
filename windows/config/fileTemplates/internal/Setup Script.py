$Import

#parse("Ruby File Header.rb")
setup(
    name='$Package_name',
    version='$Version',
    packages=$PackageList,$PackageDirs
    url='$URL',
    license='$License',
    author='$Author',
    author_email='$Author_Email',
    description='$Description'
)
