FROM ruby:2.7.1

RUN apt update -qq \
    && apt install -y nodejs npm \
    && npm install -g yarn \
    && mkdir /coffee_anywhere

# 作業ディレクトリを/coffee_anywhereに指定
WORKDIR /coffee_anywhere

# ローカルのGemfileをDokcerにコピー
COPY Gemfile* /coffee_anywhere/

RUN bundle install

# カレントディレクトリの全ファイルをコピー
# COPY . /coffee_anywhere

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]