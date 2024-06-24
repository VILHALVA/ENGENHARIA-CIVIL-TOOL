program CivilEngineeringTool;

uses
  SysUtils, Math;

function GetValidNumber(prompt: string): Double;
var
  input: string;
  value: Double;
  code: Integer;
begin
  repeat
    Write(prompt);
    ReadLn(input);
    Val(input, value, code);
    if code <> 0 then
      WriteLn('Entrada inválida. Por favor, insira um número válido.');
  until code = 0;
  GetValidNumber := value;
end;

procedure ShowMenu;
begin
  WriteLn('Ferramenta de Engenharia Civil');
  WriteLn('1. Calcular área de um círculo');
  WriteLn('2. Calcular área de um retângulo');
  WriteLn('3. Calcular volume de um cilindro');
  WriteLn('4. Converter metros para centímetros');
  WriteLn('5. Converter centímetros para metros');
  WriteLn('6. Calcular momento de inércia de uma seção retangular');
  WriteLn('7. Sair');
end;

procedure CalculateCircleArea;
var
  radius, area: Double;
begin
  radius := GetValidNumber('Digite o raio do círculo: ');
  area := Pi * Sqr(radius);
  WriteLn('Área do círculo: ', area:0:2, ' unidades quadradas');
end;

procedure CalculateRectangleArea;
var
  length, width, area: Double;
begin
  length := GetValidNumber('Digite o comprimento do retângulo: ');
  width := GetValidNumber('Digite a largura do retângulo: ');
  area := length * width;
  WriteLn('Área do retângulo: ', area:0:2, ' unidades quadradas');
end;

procedure CalculateCylinderVolume;
var
  radius, height, volume: Double;
begin
  radius := GetValidNumber('Digite o raio da base do cilindro: ');
  height := GetValidNumber('Digite a altura do cilindro: ');
  volume := Pi * Sqr(radius) * height;
  WriteLn('Volume do cilindro: ', volume:0:2, ' unidades cúbicas');
end;

procedure ConvertMetersToCentimeters;
var
  meters, centimeters: Double;
begin
  meters := GetValidNumber('Digite o valor em metros: ');
  centimeters := meters * 100;
  WriteLn(meters:0:2, ' metros é igual a ', centimeters:0:2, ' centímetros');
end;

procedure ConvertCentimetersToMeters;
var
  centimeters, meters: Double;
begin
  centimeters := GetValidNumber('Digite o valor em centímetros: ');
  meters := centimeters / 100;
  WriteLn(centimeters:0:2, ' centímetros é igual a ', meters:0:2, ' metros');
end;

procedure CalculateMomentOfInertia;
var
  base, height, inertia: Double;
begin
  base := GetValidNumber('Digite a base da seção retangular: ');
  height := GetValidNumber('Digite a altura da seção retangular: ');
  inertia := (base * Power(height, 3)) / 12;
  WriteLn('Momento de inércia: ', inertia:0:2, ' unidades^4');
end;

var
  choice: Integer;
begin
  repeat
    ShowMenu;
    Write('Escolha uma opção: ');
    ReadLn(choice);
    case choice of
      1: CalculateCircleArea;
      2: CalculateRectangleArea;
      3: CalculateCylinderVolume;
      4: ConvertMetersToCentimeters;
      5: ConvertCentimetersToMeters;
      6: CalculateMomentOfInertia;
      7: WriteLn('Saindo...');
    else
      WriteLn('Opção inválida. Por favor, escolha uma opção válida.');
    end;
    WriteLn;
  until choice = 7;
end.
