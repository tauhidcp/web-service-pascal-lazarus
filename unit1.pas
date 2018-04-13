unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, Menus, fphttpclient, fpjson, jsonparser, httpsend;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure StringGrid1PrepareCanvas(sender: TObject; aCol, aRow: Integer;
      aState: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin;
end;

procedure TForm1.Button2Click(Sender: TObject);
  var
  S          : String;
  Parser     : TJSONParser;
  Arr        : TJSONArray;
  i,j        : integer;
  SubObj     : TJSONObject;
begin
  With TFPHttpClient.Create(Nil) do
    try
      S := Get('http://localhost/pascalphp/api.php/biodata');
    finally
      Free;
    end;
    Parser := TJSONParser.Create(S);
    Arr    := Parser.Parse as TJSONArray;
    StringGrid1.RowCount := Arr.Count+1;
    // Ukuran Kolom
    StringGrid1.ColCount := 3;
    StringGrid1.ColWidths[0]:=25;
    StringGrid1.ColWidths[1]:=200;
    StringGrid1.ColWidths[2]:=200;
    // Nama Kolom
    StringGrid1.Cells[0,0] := 'No';
    StringGrid1.Cells[1,0] := 'Nama';
    StringGrid1.Cells[2,0] := 'Nomor HP';
    j := 1;
    for i := 0 to Arr.Count - 1 do
    begin
        SubObj := Arr.Objects[i];
        StringGrid1.Cells[0,j] := SubObj.Strings['id'];
        StringGrid1.Cells[1,j] := SubObj.Strings['nama'];
        StringGrid1.Cells[2,j] := SubObj.Strings['nohp'];
        j := j+1;
        StringGrid1.Repaint;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
  var
    http: TFPHTTPClient;
    jData : TJSONData;
  begin
    http := TFPHTTPClient.Create(nil);
    try
      jData := GetJSON('{"nama" : "'+Edit1.Text+'", "nohp" : "'+Edit2.Text+'"}');
      http.FormPost('http://localhost/pascalphp/api.php/biodata',jData.AsJSON);
    finally
      ShowMessage(IntToStr(http.ResponseStatusCode));
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
  var
    http: TFPHTTPClient;
    jData : TJSONData;
  begin
    http := TFPHTTPClient.Create(nil);
    try
      jData := GetJSON('{"nama" : "'+Edit4.Text+'", "nohp" : "'+Edit5.Text+'"}');
      http.FormPost('http://localhost/pascalphp/api.php/biodata/'+Edit3.Text,jData.AsJSON);
    finally
      ShowMessage(IntToStr(http.ResponseStatusCode));
    end;
end;

procedure TForm1.Button5Click(Sender: TObject);
  var
    http: TFPHTTPClient;
    jData : TJSONData;
  begin
    http := TFPHTTPClient.Create(nil);
    try
      http.Delete('http://localhost/pascalphp/api.php/biodata/'+Edit3.Text);
    finally
      ShowMessage(IntToStr(http.ResponseStatusCode));
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
  var
    Respo: TStringStream;
    S : String;
    upl : TFPHttpClient;
  begin
    upl := TFPHTTPClient.Create(nil);
    With upl do
      begin
      try
        Respo := TStringStream.Create('');
        upl.FileFormPost('http://localhost/pascalphp/upload2.php','uploadedfile','2.JPG',Respo);
        S := Respo.DataString;
        Respo.Destroy;
      finally

        ShowMessage(IntToStr(upl.ResponseStatusCode));
        Free;
      end;
    end;
  end;

procedure TForm1.Button7Click(Sender: TObject);
  var
    httpClient: THTTPSend;
  begin
    httpClient:= THTTPSend.Create;
    if httpClient.HTTPMethod('GET', 'http://localhost/pascalphp/upload/2.JPG') then
      httpClient.Document.SaveToFile('MAIN2.JPG');
    ShowMessage(IntToStr(httpClient.ResultCode));
    httpClient.Free;
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  if (StringGrid1.Cells[1,aRow] = 'Ahmad Tauhid') then
    stringgrid1.Font.Color:=clRed else
    stringgrid1.Font.Color:=clBlack;
end;

procedure TForm1.StringGrid1PrepareCanvas(sender: TObject; aCol, aRow: Integer;
  aState: TGridDrawState);
begin
          if StringGrid1.Cells[1,aRow] = 'Ahmad Tauhid' then
          begin
            StringGrid1.Canvas.Brush.Color:=clRed;
            stringgrid1.Canvas.Font.Color:=clBlack;
          end else
          begin
            StringGrid1.Canvas.Brush.Color:=clWhite;
            StringGrid1.Canvas.Font.Color:=clBlack;
          end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
    Edit3.Text:=StringGrid1.Cells[0,aRow];
    Edit4.Text:=StringGrid1.Cells[1,aRow];
    Edit5.Text:=StringGrid1.Cells[2,aRow];
end;

end.

