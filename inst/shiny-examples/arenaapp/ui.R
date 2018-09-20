
ui <- shinyUI(dashboardPage(
  skin = "blue",
  title = "Arena2R",

  dashboardHeader(title = HTML(paste(icon('play'),'Arena2R'))),

  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Import Arena Data",tabName = "data_tab", icon = icon("database")),
      menuItem("Confidence Interval Plot",tabName = "conf_int_tab", icon = icon("bar-chart")),
      menuItem("Scatter Plot",tabName = "scatter_tab", icon = icon("bar-chart"))
    )

  ), # END dashboardSidebar

  dashboardBody(
    shinyjs::useShinyjs(),
    tabItems(
      tabItem("data_tab",
              box(width = 12,title = 'Import Arena csv Files', solidHeader = T, status = 'primary',
                  fileInput("file1",
                            "Choose CSV files from directory",
                            multiple = TRUE,
                            accept=c('text/csv',
                                     'text/comma-separated-values,text/plain',
                                     '.csv')),
                  dataTableOutput("summary")
              )

      ), # END data_tab

      tabItem("conf_int_tab",
              box(width = 8, title = 'Confidence Interval Plot by Scenario', solidHeader = T, status = 'primary',
                  selectizeInput('variavelConfInt',"Select Variable", choices = NULL, multiple = F),
                  plotOutput("confint_plot")
              )
      ), # END tabItem "data_iniciativa"

      tabItem("scatter_tab",
              box(width = 10, title = 'Scatter Plot', solidHeader = T, status = 'primary',
                  selectizeInput('VariavelXScatter',"Select X Variable", choices = NULL, multiple = F),
                  selectizeInput('VariavelYScatter',"Select Y Variable", choices = NULL, multiple = F),
                  plotOutput("scatter_plot")
              )
      ) # END tabItem
    ) # END tabItems
  ) # END dashboardBody
)) # END dashboardPage
