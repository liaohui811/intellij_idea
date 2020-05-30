package rb.util

import java.io.BufferedReader
import java.io.File
import java.io.InputStreamReader
import kotlin.system.exitProcess

const val REPO_PATH = "" // FIXME set path to rubocop repository

fun main() {
  val blame = "cd $REPO_PATH; git blame manual/cops.md | cat" // history for cops.md file
  val process = ProcessBuilder().command("bash", "-c", blame).start()
  val result = mutableMapOf<String, String>()

  getText(process).forEach { it ->
    val hash = it.substringBefore(' ')
    showVersion(hash, "manual/cops.md")
      .dropWhile { it != "<!-- START_COP_LIST -->" }
      .takeWhile { it != "<!-- END_COP_LIST -->" }
      .filter { it.startsWith("*") }
      .forEach { if (!result.containsKey(it)) result[it] = hash }
  }
  val autoCorrectable = mutableSetOf<String>()
  result.forEach {
    if (isAutoCorrectable(it.key, it.value))
      autoCorrectable.add(it.key.substringAfter('[').substringBefore(']', ""))
  }
  if (errors.isEmpty())
    autoCorrectable.forEach {
      println("\"$it\",")
    }
  else {
    errors.forEach(System.err::println)
    exitProcess(1)
  }
}

fun getText(process: Process): Sequence<String> {
  val reader = BufferedReader(InputStreamReader(process.inputStream))
  return reader.lineSequence()
}

val errors = mutableSetOf<String>()

fun isAutoCorrectable(line: String, hash: String): Boolean {
  val name = line.substringBefore(']').substringAfter('[')
  val fileName = line.substringAfter('(').substringBefore('#')
  var row = -1
  val answer = showVersion(hash, "manual${File.separator}$fileName")
    .dropWhile { !it.matches(Regex("##\\s+$name")) }
    .dropWhile {
      !it.apply {
        if (it.startsWith("Enabled by default |"))
          row = it.substringBefore("Supports autocorrection").count { c -> c == '|' }
      }
        .startsWith("--- |")
    }
    .drop(1)
    .first()
    .also { assert(row > 0) }
    .dropWhile { (row > 0).apply { if (it == '|') row-- } }.substringBefore('|').trim()
  return when (answer) {
    "Yes", "Yes (Unsafe)" -> true
    "No" -> false
    else -> false.also { errors.add("NOT PARSED - $answer. On $line") }
  }
}

fun showVersion(hash: String, name: String): Sequence<String> {
  val process = ProcessBuilder().command("bash", "-c", "cd $REPO_PATH; git show $hash:$name").start()
  return getText(process)
}
