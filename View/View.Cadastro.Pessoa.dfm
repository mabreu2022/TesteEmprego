object FrmCadastroPessoas: TFrmCadastroPessoas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 428
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 387
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 461
    object BtnIncluir: TButton
      Left = 98
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TButton
      Left = 194
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExlcuir: TButton
      Left = 292
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExlcuirClick
    end
    object BtnGravar: TButton
      Left = 389
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = BtnGravarClick
    end
    object BtnNovo: TButton
      Left = 9
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 4
      OnClick = BtnNovoClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 387
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 461
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Label2: TLabel
        Left = 0
        Top = 19
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 2
        Top = 51
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 0
        Top = 84
        Width = 63
        Height = 15
        Caption = 'Documento'
      end
      object Label5: TLabel
        Left = 2
        Top = 118
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label6: TLabel
        Left = 2
        Top = 154
        Width = 62
        Height = 15
        Caption = 'Logradouro'
      end
      object Label7: TLabel
        Left = 2
        Top = 189
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
      end
      object Label8: TLabel
        Left = 0
        Top = 224
        Width = 77
        Height = 15
        Caption = 'Complemento'
      end
      object Label9: TLabel
        Left = 0
        Top = 326
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object Label10: TLabel
        Left = 3
        Top = 257
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object Label11: TLabel
        Left = 2
        Top = 289
        Width = 37
        Height = 15
        Caption = 'Cidade'
      end
      object EdtIdPessoa: TEdit
        Left = 82
        Top = 16
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object EdtNome: TEdit
        Left = 82
        Top = 48
        Width = 343
        Height = 23
        TabOrder = 1
      end
      object EdtDocumento: TEdit
        Left = 82
        Top = 81
        Width = 121
        Height = 23
        TabOrder = 2
      end
      object EdtCEP: TEdit
        Left = 82
        Top = 115
        Width = 121
        Height = 23
        TabOrder = 3
        OnExit = EdtCEPExit
      end
      object EdtLogradouro: TEdit
        Left = 82
        Top = 151
        Width = 343
        Height = 23
        TabOrder = 4
      end
      object EdtNumero: TEdit
        Left = 82
        Top = 186
        Width = 121
        Height = 23
        TabOrder = 5
      end
      object EdtComplemento: TEdit
        Left = 82
        Top = 221
        Width = 343
        Height = 23
        TabOrder = 6
      end
      object EdtUF: TEdit
        Left = 82
        Top = 323
        Width = 64
        Height = 23
        TabOrder = 9
      end
      object EdtBairro: TEdit
        Left = 82
        Top = 254
        Width = 343
        Height = 23
        TabOrder = 7
      end
      object EdtCidade: TEdit
        Left = 82
        Top = 286
        Width = 343
        Height = 23
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 316
        Width = 620
        Height = 41
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 390
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object EdtPesquisa: TEdit
          Left = 59
          Top = 9
          Width = 246
          Height = 23
          TabOrder = 0
          OnKeyPress = EdtPesquisaKeyPress
        end
        object BtnDBNav: TDBNavigator
          Left = 320
          Top = 1
          Width = 299
          Height = 39
          DataSource = DataSource1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Align = alRight
          TabOrder = 1
        end
      end
      object DbGridPessoas: TDBGrid
        Left = 0
        Top = 0
        Width = 620
        Height = 316
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DbGridPessoasCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idpessoas'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 465
            Visible = True
          end>
      end
    end
  end
  object RESTResponse1: TRESTResponse
    Left = 296
    Top = 24
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemTable
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 296
    Top = 152
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = '09634000/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 296
    Top = 88
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    SynchronizedEvents = False
    Left = 296
    Top = 216
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 456
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = MemTable
    Left = 456
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 468
    Top = 178
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
