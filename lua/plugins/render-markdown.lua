return {
    'MeanderingProgrammer/render-markdown.nvim',
    config = function ()
        require("render-markdown").setup({
            filetype = {"markdown", "quarto"}
        })
    end
}
