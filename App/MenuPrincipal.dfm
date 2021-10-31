object FBuscarCep: TFBuscarCep
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AppBuscaCEP'
  ClientHeight = 298
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_buscar: TButton
    Left = 92
    Top = 7
    Width = 65
    Height = 24
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = btn_buscarClick
  end
  object edt_cep: TEdit
    Left = 8
    Top = 8
    Width = 81
    Height = 21
    MaxLength = 8
    TabOrder = 1
    Text = '74610090'
  end
  object db_info: TDBGrid
    Left = 8
    Top = 37
    Width = 619
    Height = 254
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
