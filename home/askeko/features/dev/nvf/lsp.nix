{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    # Treesitter
    treesitter = {
      enable = true;
      fold = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      context.enable = true;
    };

    # Debugging
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    # LSP - Enable base LSP support
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      lspSignature.enable = true;
    };

    # Fast action UI (replaces nvimCodeActionMenu)
    ui.fastaction.enable = false;

    # Language-specific LSP servers
    # nvf uses vim.languages.<language> instead of vim.lsp.<server>
    languages = {
      # Nix
      nix = {
        enable = true;
        lsp.enable = true;
      };

      # TypeScript/JavaScript
      ts = {
        enable = true;
        lsp.enable = true;
        extraDiagnostics.enable = true; # eslint
      };

      # HTML
      html = {
        enable = true;
        treesitter.enable = true;
      };

      # CSS
      css = {
        enable = true;
        treesitter.enable = true;
      };

      # Tailwind CSS - handled via extraPlugins or custom config
      # There's no direct vim.languages.tailwind in nvf
      # We'll configure it via extraPlugins below
    };

    # Autocomplete
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        complete = "<C-Space>";
        confirm = "<CR>";
        next = "<Tab>";
        previous = "<S-Tab>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-d>";
        close = "<C-e>";
      };
      sources = {
        nvim_lsp = "[LSP]";
        buffer = "[Buffer]";
        path = "[Path]";
      };
    };

    # Snippets
    snippets.luasnip.enable = true;

    # Diagnostic configuration (replaces lsp-lines plugin)
    luaConfigRC.diagnostics-config = ''
      vim.diagnostic.config({ 
        virtual_lines = true,  -- Show diagnostics as virtual lines
        virtual_text = false   -- Disable inline virtual text
      })
    '';

    # Additional LSP servers using modern vim.lsp API
    luaConfigRC.extra-lsp-servers = ''
      -- Tailwind CSS Language Server  
      vim.lsp.config('tailwindcss', {
        cmd = { 'tailwindcss-language-server', '--stdio' },
        filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        root_markers = { 'tailwind.config.js', 'tailwind.config.ts', '.git' },
      })

      -- Enable them
      vim.lsp.enable('tailwindcss')
    '';
  };

  # Additional packages needed
  home.packages = with pkgs; [
    nodePackages.prettier
    # LSP servers that might not be auto-installed
    nodePackages.vscode-langservers-extracted # html, css, json, eslint
    nodePackages."@tailwindcss/language-server"
  ];
}
