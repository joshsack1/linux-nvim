return {
    {
        "JuliaEditorSupport/julia-vim",
        config = function ()
            vim.g.latex_to_unicode_auto = 0
            vim.g.latex_to_unicode_tab = 1
        end,
    },
    {
        "kdheepak/JuliaFormatter.vim",
        config = function()
            vim.cmd[[
            let g:JuliaFormatter_options = {
            \ 'indent' : 4,
            \ 'margin' : 92,
            \ 'always_for_in' : v:true,
            \ 'whitespace_typedefs' : v:false,
            \ 'whitespace_ops_in_indices' : v:true,
            "\ 'remove_extra_newlines' : v:true,
            "\ 'import_to_using' : v:false,
            "\ 'pipe_to_function_call' : v:false,
            "\ 'short_to_long_function_def' : v:false,
            "\ 'force_long_function_def' : v:false,
            "\ 'always_use_return' : v:false,
            "\ 'whitespace_in_kwargs' : v:false,
            "\ 'annotate_untyped_fields_with_any' : v:true,
            "\ 'format_docstrings' : v:true,
            "\ 'conditional_to_if' : v:false,
            "\ 'trailing_comma' : v:true,
            "\ 'join_lines_based_on_source' : v:false,
            "\ 'indent_submodule' : v:true,
            "\ 'seperate_kwargs_with_semicolon' : v:true,
            "\ 'surround_whereop_typeparameters' : v:true,
            "\ 'for_in_replacement' : v:true,
            "\ 'format_markdown' : v:true,
            \}
            " Set <leader>jf to activate julia formatter
            noremap <leader>jf :JuliaFormatterFormat<CR>
            vnoremap <leader>jf :JuliaFormatterFormat<CR>
            let g:JuliaFormatter_always_launch_server=1
            ]]
        end,
    },
}
