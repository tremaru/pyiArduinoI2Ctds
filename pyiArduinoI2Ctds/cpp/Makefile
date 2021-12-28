all: FindDevices NewAddress getData getSettings setCalibration

FindDevices             :FindDevices.cpp ../iarduino_I2C_TDS.cpp
NewAddress              :NewAddress.cpp ../iarduino_I2C_TDS.cpp
getData                 :main.cpp getData.cpp ../iarduino_I2C_TDS.cpp
getSettings             :main.cpp getSettings.cpp ../iarduino_I2C_TDS.cpp
setCalibration          :main.cpp setCalibration.cpp ../iarduino_I2C_TDS.cpp

clean:
	rm -f FindDevices NewAddress getData getSettings setCalibration
