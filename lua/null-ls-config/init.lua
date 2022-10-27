local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.hadolint, -- Dockerfile linter
        null_ls.builtins.diagnostics.luacheck, -- Lua linter
        null_ls.builtins.diagnostics.markdownlint, -- Markdown linter
        null_ls.builtins.diagnostics.php, -- Php syntax checker

        -- Php code standart checker
        null_ls.builtins.diagnostics.phpcs.with({
            args = {
                "--standard=PSR12", -- For laravel
                "--report=json",
                "-q",
                "-s",
                "--runtime-set",
                "ignore_warnings_on_exit",
                "1",
                "--runtime-set",
                "ignore_errors_on_exit",
                "1",
                "--stdin-path=$FILENAME",
                "-"
            }
        }), 

        null_ls.builtins.formatting.phpcbf, -- Php code standart formatter
        null_ls.builtins.formatting.phpcsfixer, -- Php code standart formatter
        null_ls.builtins.formatting.prettier, -- Code standart formatter

        null_ls.builtins.hover.dictionary, -- Shows defenitions of current word
    }
})

