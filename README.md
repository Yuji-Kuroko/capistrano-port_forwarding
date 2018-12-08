# capistrano-port_forwarding

デプロイ先から社内npmを参照したり、gheからデプロイを行う時用のgemです。
デプロイ先から見えないリポジトリを使ってデプロイできます。

## Gemfile

```ruby
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'capistrano-port_forwarding', github: 'Yuji-Kuroko/capistrano-port_forwarding', tag: 'v0.0.1'
```

**※rubygemsへあとでアップロードする予定です。**

### Capfile

```ruby
require "capistrano/port_forwarding"
```

## 設定パラメータ

### ポートフォワーディング設定

```ruby
set :remote_forwards, [
  '10022:repository.com:22', # git repo
]
```

### その他設定

ポートフォワードするので、各種設定も変わります。
```ruby
set :repo_url, "ssh://git@127.0.0.1:10022/#{org_name}/#{repo_name}.git"
```

