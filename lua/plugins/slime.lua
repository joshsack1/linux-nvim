return {
    "jpalardy/vim-slime",
    config = function ()
        vim.g.slime_target = "tmux"
        -- vim.g.slime_target = "wezterm"
        vim.cmd[[
        let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
        "let g:slime_default_config = {"pane_id": 1}
        "let g:slime_default_config = {"pane_direction": "next"}
        ]]
        vim.g.slime_dont_ask_default = 1
        vim.g.slime_cell_delimiter = "#%%"
        vim.cmd[[ 
        nmap <leader>cc <Plug>SlimeSendCell
        xmap <c-c><c-c> <Plug>SlimeRegionSend
        nmap <c-c><c-c> <Plug>SlimeParagraphSend
        ]]
    end,
}
