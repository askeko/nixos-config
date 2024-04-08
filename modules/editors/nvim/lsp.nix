{ pkgs, lib, ... }:
let
    lspPlugin = { name, cmd,  extraConfig ? "{}" }:
        # TODO: Add the ability to pass cmd as an array
        let setupArgs = "{ cmd = { '${cmd}' } }"; in ''
        do
            local setupArgs = ${setupArgs}
            local extraArgs = ${extraConfig}
            for k,v in pairs(extraArgs) do setupArgs[k] = v end
            require'lspconfig'.${name}.setup(setupArgs)
        end
    '';
    lspPlugins = plugins: builtins.concatStringsSep "\n" (map lspPlugin plugins);
in
with pkgs.vimPlugins; [
    {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./lua/plugin/lspconfig.lua + "\n" + (lspPlugins [
            {
                name = "nil_ls";
                cmd = "${pkgs.nil}/bin/nil";
            }

            {
                name = "texlab";
                cmd = "${pkgs.texlab}/bin/texlab";
            }

            {
                name = "omnisharp";
                cmd = "${pkgs.omnisharp-roslyn}/bin/OmniSharp";
                extraConfig = ''
                    {
                        enable_roslyn_analyzers = true,
                        enable_import_completion = true,
                    }
                '';
            }
        ]);
    }

    {
        plugin = neodev-nvim;
        type = "lua";
        config = builtins.readFile ./lua/plugin/neodev.lua;
    }
    # autocompletion
    {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./lua/plugin/cmp.lua;
    }
    cmp-buffer
    cmp-path
    cmp_luasnip
    cmp-nvim-lua
    cmp-nvim-lsp

    # Debugger
    {
        plugin = nvim-dap;
        type = "lua";
        config = builtins.readFile ./lua/plugin/dap.lua;
    }
    nvim-dap-ui # UI for Debugger

]
