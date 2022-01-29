import dash 
import seaborn as sns
import dash_html_components as html
import dash_core_components as dcc
from dash.dependencies import Input, Output

app = dash.Dash('dashboarddealex')

app.layout = html.Div(
    children = [
        html.H1('Este es mi primer dashboard en python'),
        html.P(children = 'Este dashboard vamos a filtrar por sexo', id='miparrafo'),
        dcc.Dropdown(
            id='sexo',
            options=[
                {'label': 'Hombre', 'value': 'Male'},
                {'label': 'Mujer', 'value': 'Female'}
            ],
            value='Male'

        )
    ]
)

@app.callback(
    Output(component_id='miparrafo', component_property='children'),
    [Input(component_id='sexo', component_property='value')]
)


def cambiar_parrafo(sexo):
    '''
    Esta funcion se ejecutará cada vez 
    que el usuario cambie el parametro 
    '''
    return(sexo)




app.run_server(debug=True)

