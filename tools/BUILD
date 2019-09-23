package(default_visibility = ["//visibility:public"])

java_binary(
    name = "pmd",
    main_class = "net.sourceforge.pmd.PMD",
    resources = glob(["src/main/resources/**"]),
    runtime_deps = [
        "@pmd//:runtime",
    ],
)
