
# coding: utf-8

# In[47]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')

dataN=pd.read_csv("d1-n-data.csv")
dataR=pd.read_csv("d1-r-data.csv")


# In[48]:


dataR=pd.DataFrame(dataR)
dataN=pd.DataFrame(dataN)


# In[49]:


#one sheet
df=pd.merge(dataR,dataN,how='outer',on=['time_slot','timestamp','Engine RPM','Vehicle Speed','Throttle Position','Control Module Power Supply'], sort=True)


# In[50]:


#writer=pd.ExcelWriter('df.xlsx')
#df.to_excel(writer,'Sheet1')


# In[51]:


dataFrame=df


# In[52]:


del dataFrame['Latitude']


# In[56]:


del dataFrame['Longitude']


# In[54]:


del dataFrame['Unnamed: 8']


# In[57]:


dataFrame


# ### Visualization

# - Timestamp

# In[ ]:


plt.plot(dataFrame['time_slot'],dataFrame['timestamp'])
plt.show()


# In[ ]:


plt.plot(dataFrame['Air Intake Temperature'])
plt.show()


# - speed=0 일 때 Fuel level

# In[32]:


#speed ==0
dataV=pd.read_excel("speed0.xlsx")


# In[36]:


dataV.dropna(axis=0)


# In[37]:


del dataV['Latitude']


# In[38]:


del dataV['Longitude']


# In[39]:


del dataV['Unnamed: 8']


# In[40]:


dataV


# In[58]:


dataV['Fuel Level'].dropna(axis=0)


# In[59]:


plt.plot(dataV['Time slot'],dataV['Fuel Level'])



# ### Statistics

# - data information

# In[60]:


dataFrame.info()


# - data summary

# In[61]:


dataFrame.describe()


# In[1]:


from statsmodels.graphics.tsaplots import plot_acf, plot_pacf


# In[12]:


plot_acf(dataFrame['time_slot','Fuel Level'])

