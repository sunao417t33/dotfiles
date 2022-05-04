" hashicorp/terraform-lsを使うためjuliosueiras/terraform-lspを無効化
let g:lsp_settings = {
\  'terraform-lsp': {
\    'disabled': 1,
\   },
\  'golangci-lint-langserver': {
\    'initialization_options': {'command': ['golangci-lint', 'run', '--out-format', 'json']}
\   }
\}

