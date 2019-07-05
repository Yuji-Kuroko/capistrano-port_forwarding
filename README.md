# capistrano-port_forwarding

デプロイ先から社内npmを参照したり、GithubEnterpriseからデプロイを行う時用のgemです。
デプロイ先から見えないリポジトリを使ってデプロイできます。

## Gemfile

```ruby
gem 'capistrano-port_forwarding'
```

### Capfile

```ruby
# capistrano < 3.7
require 'capistrano/deploy'
require 'capistrano/git'
require 'capistrano/port_forwarding'

# capistrano >= 3.7
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/port_forwarding'
```

## 設定パラメータ(Settings)

### ポートフォワーディング設定(Settings of port forwardings)

```ruby
set :remote_forwards, [
  '10022:repository.com:22', # git repo
]
```

### その他設定(Settings of others)

ポートフォワードするので、各種設定も変わります。
```ruby
set :repo_url, "ssh://git@127.0.0.1:10022/#{org_name}/#{repo_name}.git"
```
