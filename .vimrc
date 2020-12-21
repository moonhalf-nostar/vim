map ss :source $HOME/.vimrc<CR>

call plug#begin('~/.vim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'connorholyday/vim-snazzy'
    Plug 'voldikss/vim-translator'
    Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'psliwka/vim-smoothie'
    Plug 'jiangmiao/auto-pairs'
    Plug 'https://github.com/puremourning/vimspector'

call plug#end()

source $VIMRUNTIME/vimrc_example.vim

set nu
set rnu
set mouse=a
set clipboard=unnamedplus
set ic scs
set cul
set bex=.bak                                  " backupext
set fileencodings=utf8,cp936,gb18030,big5
set ls=2                                      " laststatus 显示窗口状态条
set stal=2                                    " showtabline 显示标题栏
set shortmess-=S
set updatetime=300
set signcolumn=number
set ambiwidth=double
set splitbelow
set splitright
"set guioptions-=mT

execute 'nohls'

if &shell =~# 'fish'
    set shell=sh
endif

autocmd BufRead *.fish set filetype =sh

noremap Y y$
"noremap . ;
"noremap ; .
let mapleader =" "
"map <c-h> <c-w><c-h>
"map <c-j> <c-w><c-j>
"map <c-k> <c-w><c-k>
"map <c-l> <c-w><c-l>
" 至行首
:cnoremap <C-A>		<Home>
" 取回较新的命令行
":cnoremap <C-N>		<Down>
" 取回以前 (较旧的) 命令行
":cnoremap <C-P>		<Up>

"
"--------------------vimspector--------------------
"
let g:vimspector_install_gadgets = [ 'debugpy' ]
let g:vimspector_enable_mappings = 'HUMAN'
"
"--------------------vim-snazzy--------------------
"
    "let g:SnazzyTransparent = 1
    "colorscheme snazzy
    colorscheme dracula
"
"--------------------vim-airline--------------------
"
    let g:airline_theme='dracula'
    let g:airline_powerline_fonts = 0
    "let g:airline_left_sep = ''
    "let g:airline_right_sep = ''
    " coc-nvim config
    let g:airline#extensions#coc#enabled = 1
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    let airline#extensions#coc#warning_symbol = 'Warning:'
    let airline#extensions#coc#error_symbol = 'Error:'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#show_tab_count = 1
    let g:airline#extensions#tabline#buffers_label = 'B'
    let g:airline#extensions#tabline#tabs_label = 'T'
    let g:airline#extensions#tabline#overflow_marker = '…'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>, <Plug>AirlineSelectPrevTab
    nmap <leader>. <Plug>AirlineSelectNextTab
"
"--------------------coc.nvim--------------------
"
    let g:coc_global_extensions = ['coc-jedi', 'coc-marketplace',
                                  \'coc-vimlsp', 'coc-json','coc-translator']
    "press 'tab' to complete
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-o> to trigger completion.
    inoremap <silent><expr> <c-o> coc#refresh()
    "press 'enter' to confirm completion
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " Use `[g` and `]g` to navigate diagnostics 导航到代码错误处
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Remap <C-f> and <C-b> for scroll float windows/popups.
    " Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Mappings for CoCList
    " Show CocList.
    nnoremap <silent><nowait> <leader>l  :<C-u>CocList<cr>
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    "nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
    "" Search workspace symbols.
    "nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
    "" Do default action for next item.
    "nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
    "" Do default action for previous item.
    "nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
    "" Resume latest coc list.
    "nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>
    " CocTranslator 
    "nmap <leader>t <Plug>(coc-translator-p)
    "vmap <leader>t <Plug>(coc-translator-pv)

"
"--------------------vim-translator--------------------
"
    " Display translation in a window
    nmap <silent> <leader>w <Plug>TranslateW
    vmap <silent> <leader>w <Plug>TranslateWV
    let g:translator_default_engines=['bing', 'google', 'haici', 'youdao']
    nmap <silent> <leader>t :<c-u>NERDTreeToggle<CR>

