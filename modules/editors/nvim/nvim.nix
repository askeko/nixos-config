{ pkgs, lib, vars, ... }:

{

home-manager.users.${vars.user} = {
programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = let
        readFile = builtins.readFile;
        pluginSetup = plugin: pluginName: { inherit plugin; type = "lua"; config = "require'${pluginName}'.setup()"; };
        defaults = plugin: {
            type = "lua";
            config = if plugin ? configFile
                then readFile plugin.configFile
                else plugin.config or null;
        };
    in
    with pkgs.vimPlugins; map (p: (defaults p) // builtins.removeAttrs p [ "configFile" ]) [

        nvim-web-devicons

        {
            plugin = telescope-nvim;
            configFile = ./lua/plugin/telescope.lua;
        }

        {
            plugin = dracula-nvim;
            type = "viml";
            config = "colorscheme dracula";
        }

        nvim-treesitter.withAllGrammars

        # git plugins
        {
            plugin = vim-fugitive;
            config = "vim.keymap.set('n', '<leader>gs', vim.cmd.Git)";
        }

        vim-rhubarb

        # symbols in the gutter and git utilities
        {
          plugin = gitsigns-nvim;
          configFile = ./lua/plugin/gitsigns.lua;
        }

        # comment lines with "gc"
        (pluginSetup comment-nvim "Comment")

        # detect tabstop and shiftwidth automatically
        vim-sleuth

        # status notifications
        (pluginSetup fidget-nvim "fidget")

        # show pending keybinds
        (pluginSetup which-key-nvim "which-key")

        vim-repeat
        vim-surround

        {
            plugin = lsp-zero-nvim;
            configFile = ./lua/plugin/lspzero.lua;
        }

        # inline function call signature hints
        lsp_signature-nvim

        {
            plugin = formatter-nvim;
            configFile = ./lua/plugin/formatter.lua;
        }

        luasnip

        {
            plugin = harpoon;
            configFile = ./lua/plugin/harpoon.lua;
        }

        {
            plugin = trouble-nvim;
            configFile = ./lua/plugin/trouble.lua;
        }

        {
            plugin = neo-tree-nvim;
            config = "vim.keymap.set('n', '<c-n>', ':Neotree<CR>')";
        }

        {
            plugin = vimtex;
            configFile = ./lua/plugin/vimtex.lua;
        }

        # Sticky scope header
        (pluginSetup nvim-treesitter-context "treesitter-context")
    ] ++
        import ./lsp.nix { inherit pkgs lib; };
    extraLuaConfig = builtins.concatStringsSep "\n" ((map  builtins.readFile (import ./lua)) ++ [

    ]);
    extraPackages = with pkgs; [
        lua-language-server
        nil
        texlab
    ];
    };
};
}
