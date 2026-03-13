{
  programs.nvf.settings.vim.visuals.fidget-nvim = {
    enable = true;
    setupOpts = {
      notification.override_vim_notify = true;
    };
  };

  programs.nvf.settings.vim.luaConfigRC.roslyn-fidget = ''
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        require("fidget").notify(client.name .. " attached", vim.log.levels.INFO, {
          key = client.name,
          ttl = 3,
        })

        if client.name == "roslyn_ls" then

          client.handlers["window/logMessage"] = function(err, result, ctx)
            if result.type <= 2 and not result.message:find("roslyn%-canonical%-misc") then
              local msg = result.message
                :match("^%[.-%]%s*%[.-%]%s*(.+)$")
                or result.message:match("^%[.-%]%s*(.+)$")
                or result.message

              require("fidget").notify(
                msg,
                result.type == 1 and vim.log.levels.ERROR or vim.log.levels.WARN,
                { key = "roslyn", ttl = 5 }
              )
            end
          end

          local ready = false
          client.handlers["workspace/semanticTokens/refresh"] = function(err, result, ctx)
            if not ready then
              ready = true
              require("fidget").notify(
                "roslyn_ls ready",
                vim.log.levels.INFO,
                { key = "roslyn_ready", ttl = 5 }
              )
            end
            return vim.NIL
          end

        end
      end,
    })
  '';
}
