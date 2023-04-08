program Hello;
var 
  computerChoice: string;
  userChoice: string;
  omitSelections: boolean;

function getComputerChoice : string;
  var 
      randomNumber: integer = 0;
  begin
      Randomize;
      randomNumber := round(Random * 100) mod 3;
      
      if randomNumber = 1 then
          getComputerChoice := 'p'
      else
          if randomNumber = 2 then
              getComputerChoice := 'r'
          else
              getComputerChoice := 's'
end;

function getCompleteStringOfChoice(shortChoice : string) : string;
begin
    if shortChoice = 'p' then
        getCompleteStringOfChoice := 'Paper'
    else
        begin
            if shortChoice = 'r' then
                getCompleteStringOfChoice := 'Rock'
            else
                getCompleteStringOfChoice := 'Scissors'
        end
end;

begin
    writeln ('Jankenpo');
    writeln ('========');
    writeln ('');
    writeln ('Please insert "p" for "paper", "r" for "rock" or "s" for "scissors"');
    ReadLn(userChoice);
    computerChoice := getComputerChoice();
    omitSelections := false;

    if (((userChoice = 'p') and (computerChoice = 'r')) or ((userChoice = 'r') and (computerChoice = 's')) or ((userChoice = 's') and (computerChoice = 'p'))) 
    then writeln('User win')
    else 
        begin
            if (userChoice = computerChoice) then 
                writeln('Draw')
            else
                begin
                    if ((userChoice <> 'p') and (userChoice <> 'r') and (userChoice <> 's')) then 
                        begin
                            writeln('Invalid option. Please type p, r or s (one letter only)');
                            omitSelections := true;
                        end
                    else 
                        writeln('Computer win')
                end
        end;

    if omitSelections = false then
        begin
            writeln('User selected: ' + getCompleteStringOfChoice(userChoice));
            writeln('Computer selected: ' + getCompleteStringOfChoice(computerChoice));
        end;
end.