'''
Created By: Andre Hazim
Created For: ICS3U
Created On: -Sep-2017
Calculates the cost of a pizza given the diameter inputted by a user
'''

import ui

def calculate_button_touch_up_inside(sender):
    # calculate circumference
    
    # constants
    PI = 3.14
    LABOUR_COST = 0.75
    RENT_COST = 1.00
    MATERIAL_COST = 0.50
    HST = 0.13
    
    # input
    diameter = float(view['pizza_diameter_textfield'].text)
    
    # process
    sub_total = LABOUR_COST + RENT_COST + (MATERIAL_COST * diameter) 
    cost = sub_total + (sub_total * HST)
    
    # output
    # got currency format from here:
    #   http://stackoverflow.com/questions/21208376/converting-float-to-dollars-and-cents
    view['final_cost_label'].text = 'The cost is: ' + '${:,.2f}'.format(cost)

view = ui.load_view()
view.present('sheet')
