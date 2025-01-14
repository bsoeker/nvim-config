local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", "/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
        "-configuration", "/usr/share/java/jdtls/config_linux",
        "-data", workspace_dir,
    },
    root_dir = root_dir,
    capabilities = capabilities, -- Add this line
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-23",
                        path = "/usr/lib/jvm/java-23-openjdk",
                    },
                },
            },
        },
    },
}

require("jdtls").start_or_attach(config)
