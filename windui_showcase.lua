--[[
    WindUI - Showcase completo de elementos
    Carrega a lib e demonstra: Window, KeySystem, Tab, Tab Section,
    Section, Button, Toggle, Slider, Input, Dropdown, Paragraph,
    Keybind, Colorpicker, Code, Divider, Space, Image, HStack/VStack,
    ProgressBar, Tag, Dialog, Popup, Notification.
]]

-- ===== Carregando a lib =====
local _version = "1.6.66"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()

-- ===== Notificação inicial =====
WindUI:Notify({
    Title = "WindUI",
    Content = "Showcase carregado com sucesso!",
    Duration = 3
})

-- ===== Criando a Window =====
local Window = WindUI:CreateWindow({
    Title = "WindUI Showcase",
    Icon = "layout-grid",
    Author = "Exemplo com todos os elementos",
    Folder = "WindUIShowcase", -- usado pelo sistema de Configs
    Size = UDim2.fromOffset(650, 500),
    Theme = "Dark",
    Resizable = true,
})

-- ===== Tab Section (agrupa tabs) =====
local MainSection = Window:Section({
    Title = "Menu Principal"
})

-- ===== Tabs =====
local ElementsTab = MainSection:Tab({ Title = "Elementos", Icon = "layout-grid" })
local LayoutTab = MainSection:Tab({ Title = "Layout", Icon = "columns" })
local MiscTab = MainSection:Tab({ Title = "Diversos", Icon = "sparkles" })

-- =====================================================
-- ABA: ELEMENTOS
-- =====================================================

local BasicSection = ElementsTab:Section({
    Title = "Elementos Básicos",
    Desc = "Button, Toggle, Slider, Input",
    Icon = "mouse-pointer-click",
    Opened = true
})

BasicSection:Button({
    Title = "Botão de Exemplo",
    Desc = "Clique para disparar um callback",
    Icon = "save",
    Callback = function()
        WindUI:Notify({ Title = "Button", Content = "Botão clicado!", Duration = 2 })
    end
})

BasicSection:Toggle({
    Title = "Toggle de Exemplo",
    Desc = "Liga/desliga um estado",
    Icon = "power",
    Value = false,
    Flag = "example_toggle", -- salvo automaticamente pelo Config
    Callback = function(state)
        print("Toggle:", state)
    end
})

BasicSection:Slider({
    Title = "Slider de Exemplo",
    Desc = "Valor numérico dentro de um range",
    Value = { Min = 0, Max = 100, Default = 50 },
    Step = 1,
    Flag = "example_slider",
    Callback = function(value)
        print("Slider:", value)
    end
})

BasicSection:Input({
    Title = "Input de Exemplo",
    Desc = "Campo de texto",
    Placeholder = "Digite algo...",
    Flag = "example_input",
    Callback = function(text)
        print("Input:", text)
    end
})

local SelectionSection = ElementsTab:Section({
    Title = "Seleção e Entrada",
    Desc = "Dropdown, Keybind, Colorpicker",
    Icon = "list",
    Opened = false
})

SelectionSection:Dropdown({
    Title = "Dropdown de Exemplo",
    Desc = "Selecione uma opção",
    Values = { "Opção 1", "Opção 2", "Opção 3" },
    Value = "Opção 1",
    Flag = "example_dropdown",
    Callback = function(selected)
        print("Selecionado:", selected)
    end
})

SelectionSection:Keybind({
    Title = "Keybind de Exemplo",
    Desc = "Atalho de teclado",
    Value = "V",
    Flag = "example_keybind",
    Callback = function(key)
        print("Tecla pressionada:", key)
    end
})

SelectionSection:Colorpicker({
    Title = "Colorpicker de Exemplo",
    Desc = "Escolha uma cor",
    Default = Color3.fromRGB(100, 150, 255),
    Flag = "example_color",
    Callback = function(color)
        print("Cor selecionada:", color)
    end
})

local DisplaySection = ElementsTab:Section({
    Title = "Exibição de Conteúdo",
    Desc = "Paragraph, Code, Image, ProgressBar",
    Icon = "file-text",
    Opened = false
})

DisplaySection:Paragraph({
    Title = "Paragraph de Exemplo",
    Desc = "Texto informativo, pode ter imagem/thumbnail e botões",
    Image = "info"
})

DisplaySection:Code({
    Title = "Trecho de Código",
    Code = "print('Olá, WindUI!')",
    CanCopied = true
})

DisplaySection:Image({
    Image = "rbxassetid://0", -- troque pelo seu asset
    AspectRatio = "16:9",
    Radius = 12,
})

DisplaySection:ProgressBar({
    Title = "Progresso",
    Desc = "Exemplo de progresso",
    Value = { Min = 0, Max = 100, Default = 42 },
    DisplayMode = "Percent",
})

-- =====================================================
-- ABA: LAYOUT
-- =====================================================

LayoutTab:Paragraph({
    Title = "Organização Visual",
    Desc = "Divider, Space e HStack/VStack"
})

LayoutTab:Button({ Title = "Botão A" })
LayoutTab:Button({ Title = "Botão B" })

LayoutTab:Divider() -- separador visual

LayoutTab:Button({ Title = "Botão C" })

LayoutTab:Space({ Columns = 1 }) -- espaçamento

-- HStack com dois VStacks lado a lado
local MainHStack = LayoutTab:HStack()

local LeftVStack = MainHStack:VStack()
LeftVStack:Button({ Title = "Esquerda 1" })
LeftVStack:Toggle({ Title = "Esquerda 2" })

local RightVStack = MainHStack:VStack()
RightVStack:Button({ Title = "Direita 1" })
RightVStack:Slider({
    Title = "Direita 2",
    Value = { Min = 0, Max = 10, Default = 5 }
})

-- =====================================================
-- ABA: DIVERSOS (Tag, Dialog, Popup, Notification)
-- =====================================================

MiscTab:Paragraph({
    Title = "Tag, Dialog, Popup e Notification",
    Desc = "Elementos de feedback e interação"
})

-- Tag no topo da janela (fora da tab, mas criado aqui por conveniência)
local ExampleTag = Window:Tag({
    Title = "Status: OK",
    Color = Color3.fromRGB(100, 220, 120)
})

MiscTab:Button({
    Title = "Mudar Tag",
    Callback = function()
        ExampleTag:SetTitle("Status: Alterado")
        ExampleTag:SetColor(Color3.fromRGB(255, 180, 60))
    end
})

MiscTab:Button({
    Title = "Abrir Dialog",
    Icon = "message-circle-question",
    Callback = function()
        local Dialog = Window:Dialog({
            Title = "Confirmar Ação",
            Content = "Você tem certeza que deseja continuar?",
            Buttons = {
                {
                    Title = "Sim",
                    Variant = "Primary",
                    Callback = function()
                        WindUI:Notify({ Title = "Dialog", Content = "Confirmado!", Duration = 2 })
                    end
                },
                {
                    Title = "Não",
                    Callback = function()
                        WindUI:Notify({ Title = "Dialog", Content = "Cancelado.", Duration = 2 })
                    end
                }
            }
        })
        Dialog:Show()
    end
})

MiscTab:Button({
    Title = "Abrir Popup",
    Icon = "megaphone",
    Callback = function()
        WindUI:Popup({
            Title = "Bem-vindo!",
            Content = "Este é um exemplo de Popup standalone.",
            Buttons = {
                {
                    Title = "Entendi",
                    Callback = function() end
                }
            }
        })
    end
})

MiscTab:Button({
    Title = "Disparar Notification",
    Icon = "bell",
    Callback = function()
        WindUI:Notify({
            Title = "Notificação",
            Content = "Esta é uma notificação de teste.",
            Duration = 3
        })
    end
})

-- ===== Salvar configs manualmente (opcional) =====
local MyConfig = Window.ConfigManager:Config("ShowcaseConfig")
MiscTab:Button({
    Title = "Salvar Configurações",
    Icon = "save",
    Callback = function()
        MyConfig:Save()
        WindUI:Notify({ Title = "Config", Content = "Configurações salvas!", Duration = 2 })
    end
})
