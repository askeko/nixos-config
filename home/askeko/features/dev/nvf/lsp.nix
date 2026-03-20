{pkgs, ...}: {
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
      # Dotnet lsp omnisharp extras
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
        format = {
          type = ["alejandra"];
        };
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

      # Python
      python = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["pyright"];
        };
        treesitter.enable = true;
        format = {
          enable = true;
          type = ["ruff"];
        };
      };

      # C#
      csharp = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["roslyn_ls"];
        };
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

      -- Register alejandra in conform for nix files using pinned version
      require("conform").formatters.alejandra = {
        command = '${pkgs.alejandra}/bin/alejandra',
      }
      require("conform").formatters_by_ft.nix = { "alejandra" }

      -- Override <leader>lf to use conform instead of LSP format
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "<leader>lf", function()
            require("conform").format({ bufnr = 0, lsp_fallback = true })
          end, { buffer = args.buf, desc = "Format" })
        end,
      })
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
