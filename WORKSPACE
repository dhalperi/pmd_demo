workspace(name = "pmd_demo")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_jar")

##########################################################
# The Maven artifacts depended-upon by our Java projects #
##########################################################

##########################################################
## First section: enable pubref_rules_maven at all
git_repository(
    name = "org_pubref_rules_maven",
    commit = "339c378f856461add63f155d82077de5813e649e",
    remote = "https://github.com/pubref/rules_maven",
    shallow_since = "1555185650 -0600",
)

load("@org_pubref_rules_maven//maven:rules.bzl", "maven_repositories", "maven_repository")

maven_repositories()

##########################################################
## Second section: per-library, what we depend on

# PMD
maven_repository(
    name = "pmd",
    force = [
        "org.antlr:antlr4-runtime:4.7.2",
        "com.google.code.gson:gson:2.8.0",
        "org.ow2.asm:asm:7.1",
    ],
    transitive_deps = [
        "6375e521c1e11d6563d4f25a07ce124ccf8cd171:com.beust:jcommander:1.72",
        "c4ba5371a29ac9b2ad6129b1d39ea38750043eff:com.google.code.gson:gson:2.8.0",
        "815893df5f31da2ece4040fe0a12fd44b577afaf:commons-io:commons-io:2.6",
        "f19b7d4278b837fe92504946e6860b0bcc180956:net.java.dev.javacc:javacc:5.0",
        "b128622fc95edae0e166eb69c76727774d1be34d:net.sourceforge.pmd:pmd-core:6.12.0",
        "9fe0bceb83361d94ab45f2dddda1af3604882369:net.sourceforge.pmd:pmd-java:6.12.0",
        "9ffdd08cb74563cbd431c845238b414e933a0483:net.sourceforge.saxon:saxon:9.1.0.8",
        "e27d8ab4f984f9d186f54da984a6ab1cccac755e:org.antlr:antlr4-runtime:4.7.2",
        "6505a72a097d9270f7a9e7bf42c4238283247755:org.apache.commons:commons-lang3:3.8.1",
        "fa29aa438674ff19d5e1386d2c3527a0267f291e:org.ow2.asm:asm:7.1",
    ],
    deps = [
        "net.sourceforge.pmd:pmd-core:6.12.0",
        "net.sourceforge.pmd:pmd-java:6.12.0",
    ],
)

load("@pmd//:rules.bzl", "pmd_compile")

pmd_compile()
