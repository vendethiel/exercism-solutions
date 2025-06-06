-module(bank_account).
-behaviour(gen_server).
-export([balance/1, charge/2, close/1, create/0, deposit/2, withdraw/2]).
-export([init/1, handle_call/3, handle_cast/2]).

balance(Pid) ->
  gen_server:call(Pid, balance).

charge(Pid, Amount) ->
  gen_server:call(Pid, {charge, Amount}).

close(Pid) ->
  gen_server:call(Pid, close).

create() ->
  {ok, Pid} = gen_server:start_link(?MODULE, [], []),
  Pid.

deposit(Pid, Amount) ->
  gen_server:call(Pid, {deposit, Amount}).

withdraw(Pid, Amount) ->
  gen_server:call(Pid, {withdraw, Amount}).

% Gen server stuff
init(_Args) ->
  {ok, {open, 0}}.

handle_call(_Args, _From, closed) ->
  {reply, {error, account_closed}, closed};
handle_call(balance, _From, {open, N}) ->
  {reply, N, {open, N}};
handle_call(close, _From, {open, N}) ->
  {reply, N, closed};
handle_call({deposit, Amount}, _From, {open, N}) when Amount > 0 ->
  {reply, Amount, {open, N + Amount}};
handle_call({deposit, _}, _From, State) ->
  {reply, fail, State};
handle_call({withdraw, Amount}, _From, {open, N}) when Amount > 0, Amount =< N ->
  {reply, Amount, {open, N - Amount}};
handle_call({withdraw, Amount}, _From, {open, N}) when Amount > 0 ->
  {reply, N, {open, 0}};
handle_call({withdraw, _}, _From, State) ->
  {reply, 0, State};
handle_call({charge, Amount}, _From, {open, N}) when Amount > 0, Amount =< N ->
  {reply, Amount, {open, N - Amount}};
handle_call({charge, _}, _From, State) ->
  {reply, 0, State}.

handle_cast(_, State) ->
  {noreply, State}.