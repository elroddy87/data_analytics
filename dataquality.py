import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from IPython.display import display
from markdownipy import markdownipy
from IPython.display import Markdown

def render_markdown(text):
    md = markdownipy.markdownipy()
    md < text | md.h3
    display(Markdown(md.print()))


def data_check(x):
    #Top 5 rows
    render_markdown('Top 5 Rows')
    display(x.head())

    #Bottom 5 rows
    render_markdown('Bottom 5 Rows')
    display(x.tail())

    #Random Sample
    render_markdown('Random Sample')
    display(x.sample())
    
    #Number of Columns and Rows
    render_markdown('Number of Columns and Rows')
    display(x.shape)

    #Overview of Data
    render_markdown('Overview of the Data')
    display(x.info())

    #Total Duplicates
    render_markdown('Total Duplicates')
    display(x.duplicated().sum())

    #Total Missing by Column
    render_markdown('Total Missing by Column')
    display(x.isnull().sum())

    #Count of Unique Values by Column
    render_markdown('Count of Unique Values by Column')
    display(x.nunique())
    

    #Descriptive Stats
    render_markdown('Statistics Summary')
    display(x.describe())

    #First 10 Values Chart
    render_markdown('First 10 Values Chart')
    w = len(x.columns)
    plt.figure(figsize = (20,6))
    chart = x.nunique()
    chart = pd.DataFrame(chart).reset_index()
    chart = chart.head(10)
    display(chart)
    sns.barplot(x = 'index', y = 0, hue = 'index', data =chart)
    plt.show()
    














    