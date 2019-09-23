package(default_visibility = ["//visibility:public"])

load("@//tools:pmd_test.bzl", "pmd_test")

java_library(
    name = "main",
    srcs = glob(["src/main/java/**"]),
)

pmd_test(
    name = "pmd",
    lib = ":main",
)
