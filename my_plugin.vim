call plug#begin()
    " The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'

    " Make sure you use single quotes

    " - Automatically executes `filetype plugin indent on` and `syntax enable`.

    " colorschemes
    Plug 'vim-scripts/peaksea'
    Plug 'dracula/vim'
    Plug 'vim-scripts/mayansmoke'
    Plug 'therubymug/vim-pyte'
    Plug 'tomasr/molokai'


    " status-line
    " Plug 'itchyny/lightline.vim'

    Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#scrollbar#enabled = 0
    let g:airline#extensions#scrollbar#minwidth = 100
    let g:airline#extensions#tabline#buf_label_first = 1
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
    nmap <leader>0 <Plug>AirlineSelectTab0
    nmap <leader>, <Plug>AirlineSelectPrevTab
    nmap <leader>. <Plug>AirlineSelectNextTab

    Plug 'easymotion/vim-easymotion'
    Plug 'yianwillis/vimcdoc'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'psliwka/vim-smoothie'
    Plug 'tpope/vim-surround'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'

    Plug 'preservim/nerdtree'
    let g:NERDTreeWinSize = 33
    let g:NERDTreeWinPos = 'right'
    nnoremap <leader>ee :NERDTreeToggle<CR>
    nnoremap <leader>ef :NERDTreeFocus<CR>
    nnoremap <leader>et :NERDTreeToggle<CR>
    nnoremap <leader>em :NERDTreeMirror<CR>
    nnoremap <leader>ec :NERDTreeClose<CR>

    Plug 'jlanzarotta/bufexplorer'
    " Plug 'fholgado/minibufexpl.vim'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'luochen1990/rainbow'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'mhinz/vim-startify'
    Plug 'rickhowe/diffchar.vim'

    Plug 'mbbill/undotree'
    nnoremap gn :UndotreeToggle<CR>:UndotreeFocus<CR>

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " let g:lightline = {
    "   \ 'colorscheme': 'darcula',
    "   \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map e <Plug>(easymotion-prefix)
    noremap ee e
    map <Plug>(easymotion-prefix)o <Plug>(easymotion-e)
    let g:EasyMotion_smartcase = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " let g:sneak#s_next = 1
    let g:sneak#use_ic_scs = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

