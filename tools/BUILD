package(default_visibility = ["//visibility:public"])

exports_files(["src/main/resources/pmd-ruleset.xml"])

java_binary(
    name = "pmd",
    main_class = "net.sourceforge.pmd.PMD",
    runtime_deps = [
        "@pmd//:runtime",
    ],
)
