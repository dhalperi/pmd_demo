"""Test rule that executes PMD against a given library."""

def _impl(ctx):
    lib = ctx.attr.lib[JavaInfo]
    src_jars = lib.source_jars
    if len(lib.source_jars) != 1:
        fail("Expecting a single java library")

    src_jar = lib.source_jars[0]
    full_compile_jars = ":".join([f.path for f in lib.full_compile_jars.to_list()])

    # Presumably this needs to be updated to actually run the resulting shell script.
    cmd = "@//tools:pmd"

    args = [
        cmd,
        "-f text",
        "-R pmd-ruleset.xml",
        "-d {}".format(src_jar.short_path),
	"-auxclasspath {}".format(full_compile_jars),
    ]
    argline = " ".join(args)

    script = '\n'.join([
        argline,
    ])
    print(script)

    # Write the file, it is executed by 'bazel test'.
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = script,
    )

    runfiles = ctx.runfiles(files=ctx.files.lib)
    return [DefaultInfo(runfiles=runfiles)]

pmd_test = rule(
    implementation = _impl,
    attrs = {
        "lib": attr.label(mandatory=True, allow_single_file=True),
    },
    test = True,
)
