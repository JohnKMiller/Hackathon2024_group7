import pandas as pd

def excel_to_bootstrap_tables(excel_file):
    # Read Excel file
    df = pd.read_excel(excel_file)
    
    # Initialize HTML string
    html_tables = ""
    
    # Loop through each row
    for index, row in df.iterrows():
        # Start table with Bootstrap styling
        html_table = "<div class='table-responsive'><table class='table table-striped'>"
        
        # Add table headers
        html_table += "<thead><tr>"
        for col_name in df.columns:
            html_table += f"<th>{col_name}</th>"
        html_table += "</tr></thead>"
        
        # Add table body with row data
        html_table += "<tbody><tr>"
        for value in row:
            html_table += f"<td>{value}</td>"
        html_table += "</tr></tbody>"
        
        # End table
        html_table += "</table></div>"
        
        # Add current table to the HTML string
        html_tables += html_table
    
    return html_tables

# Example usage
if __name__ == "__main__":
    # Path to Excel file (replace this with your file path)
    excel_file = "data.xlsx"
    
    # Convert Excel to Bootstrap tables
    bootstrap_tables = excel_to_bootstrap_tables(excel_file)
    
    # Print the Bootstrap tables
    print(bootstrap_tables)
