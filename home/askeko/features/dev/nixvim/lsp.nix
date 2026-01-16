{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
        folding.enable = false;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
      treesitter-context.enable = true;
      dap.enable = true;
      dap-ui.enable = true;
      lint.enable = true;
      luasnip.enable = true;
      lsp-lines = {
        enable = true;
        luaConfig.content = "vim.diagnostic.config({ virtual_lines = true, virtual_text = false })";
      };
      lsp-format.enable = true;
      none-ls = {
        # Active null-ls fork. Used to add non-LSP sources to LSP
        enable = true;
        sources.formatting = {
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            settings.filetypes = [
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
              "css"
              "html"
            ];
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true; # Lua
          ts_ls.enable = true; # Typescript
          eslint.enable = true; # Eslint
          emmet_language_server.enable = true; # Emmet
          tailwindcss.enable = true; # Tailwindcss
          html.enable = true; # HTML
          cssls.enable = true; # CSS
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>rn" = {
              action = "rename";
              desc = "Rename Symbol";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Action";
            };
            "<leader>f" = {
              action = "format";
              desc = "Format Document";
            };
          };
          diagnostic = {
            "<leader>k" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "<leader>df" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "<leader>dn" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "<leader>dN" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
          sources = [
            {
              name = "nvim_lsp";
            }
            {
              name = "luasnip";
            }
            {
              name = "path";
            }
            {
              name = "buffer";
            }
          ];
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      haskell-tools-nvim
    ];
    keymaps = [
      {
        key = "<leader>hs";
        mode = "n";
        action = ":lua require('haskell-tools').hoogle.hoogle_signature()<CR>";
      }
      {
        key = "<leader>he";
        mode = "n";
        action = ":lua require('haskell-tools').lsp.buf_eval_all()<CR>";
      }
      {
        key = "<leader>hr";
        mode = "n";
        action = ":lua require('haskell-tools').repl.toggle()<CR>";
      }
    ];
  };
  home.packages = with pkgs; [
    haskellPackages.haskell-language-server
  ];
}
