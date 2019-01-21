FROM ubuntu:latest

RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y wget
RUN apt-get install -y gnupg2

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang
RUN apt-get install -y elixir
RUN apt-get install -y inotify-tools
RUN mix local.hex --force

RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
RUN mix archive.install https://raw.githubusercontent.com/phoenixframework/archives/master/phx_new.ez --force
RUN mix phx.new app

WORKDIR /app
RUN sed -i 's/cowboy/plug_cowboy/g' mix.exs
RUN mix deps.get --force
RUN mix local.rebar --force
CMD ["mix", "phx.server"]
