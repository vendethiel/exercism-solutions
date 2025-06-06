-module(all_your_base).

-export([rebase/3]).


rebase(_, InputBase, _) when InputBase < 2 ->
    {error, "input base must be >= 2"};
rebase(_, _, OutputBase) when OutputBase < 2 ->
    {error, "output base must be >= 2"};
rebase(Digits, InputBase, OutputBase) ->
    try parse(Digits, InputBase) of
        Parsed -> output(Parsed, OutputBase)
    catch
        throw:Msg -> {error, Msg}
    end.


parse(Digits, InputBase) ->
    parse(Digits, InputBase, length(Digits) - 1).

parse([], _, _) ->
    0;
parse([X|_], InputBase, _) when X >= InputBase; X < 0 ->
    throw("all digits must satisfy 0 <= d < input " "base");
parse([X|Xs], InputBase, Offset) ->
    Val = X * round(math:pow(InputBase, Offset)),
    Val + parse(Xs, InputBase, Offset - 1).

output(Value, OutputBase) ->
    Digits = output(Value, OutputBase, []),
    {ok, Digits}.

output(0, _, []) ->
    [0];
output(0, _, Digits) ->
    Digits;
output(Value, OutputBase, Digits) ->
    Rem = Value rem OutputBase,
    Div = floor(Value / OutputBase),
    output(Div, OutputBase, [Rem|Digits]).