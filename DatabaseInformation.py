import firebase_admin
from firebase_admin import credentials, firestore
# Initialize Firebase Admin SDK with the service account key

import tkinter as tk
from tkinter import scrolledtext
# GUI

cred = credentials.Certificate("astralarms-a7a8f-firebase-adminsdk-sltkf-88a9f35d08.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
# Access9ollo9 Firestore

ref = db.collection('Experiments')
#collection stores information in a firestore database


docs = ref.stream()
# Retrieve data from the collection



for doc in docs:
    data = doc.to_dict()
    
    # Access fields based on the data structure
    exp_duration = data.get('expDuration', '')
    exp_materials = data.get('expMaterials', '')
    exp_name = data.get('expName', '')
    exp_organisation = data.get('expOrganisation', '')
    exp_precautions = data.get('expPrecautions', '')
    exp_procedure = data.get('expProcedure', '')

    window = tk.Tk()
    window.title('Experiment Information')

    text_widget = scrolledtext.ScrolledText(window, width=50, height=20)
    text_widget.pack()    
    
    text_widget.insert(tk.END, f'Experiment Duration: {exp_duration}\n')
    text_widget.insert(tk.END, f'Experiment Materials: {exp_materials}\n')
    text_widget.insert(tk.END, f'Experiment Name: {exp_name}\n')
    text_widget.insert(tk.END, f'Experiment Organisation: {exp_organisation}\n')
    text_widget.insert(tk.END, f'Experiment Precautions: {exp_precautions}\n')
    text_widget.insert(tk.END, f'Experiment Procedure: {exp_procedure}\n')
    text_widget.insert(tk.END, '-' * 30 + '\n')

window.mainloop()