# distutils: language = c++
# cython: language_level = 3

from iarduino_I2C_TDS cimport iarduino_I2C_TDS
#from time import sleep

DEF_CHIP_ID_FLASH =  0x3C
DEF_CHIP_ID_METRO =  0xC3

# Адреса регистров модуля:
REG_FLAGS_0          =  0x00
REG_BITS_0           =  0x01
REG_FLAGS_1          =  0x02
REG_BITS_1           =  0x03
REG_MODEL            =  0x04
REG_VERSION          =  0x05
REG_ADDRESS          =  0x06
REG_CHIP_ID          =  0x07
REG_SHT_PERIOD       =  0x08
REG_SHT_FLG          =  0x10
REG_SHT_TEM_L        =  0x11
REG_SHT_HUM_L        =  0x13
REG_SHT_TEM_CHANGE   =  0x15
REG_SHT_HUM_CHANGE   =  0x16
# Позиция битов и флагов:
SHT_TEM_NEGATIVE     =  0x80
SHT_FLG_CHANGED_HUM  =  0x04
SHT_FLG_CHANGED_TEM  =  0x02
SHT_FLG_CHANGED      =  0x01

NO_BEGIN = 1

cdef class pyiArduinoI2Ctds:
    cdef iarduino_I2C_TDS c_module

    def __cinit__(self, address=None, auto=None):

        if address is not None:

            self.c_module = iarduino_I2C_TDS(address)

            if auto is None:
                #sleep(.5)
                if not self.c_module.begin():

                    print("ошибка инициализации модуля.\n"
                          "Проверьте подключение и адрес модуля,"
                          " возможно не включен интерфейс I2C.\n"
                          " Запустите raspi-config и включите интерфейс"
                          ", инструкция по включению:"
                          " https://wiki.iarduino.ru/page/raspberry-i2c-spi/")

        else:

            self.c_module = iarduino_I2C_TDS()

            if auto is None:
                #sleep(.5)
                if not self.c_module.begin():

                    print("ошибка инициализации модуля.\n"
                          "Проверьте подключение и адрес модуля, "
                          " возможно не включен интерфейс I2C.\n"
                          " Запустите raspi-config и включите интерфейс"
                          ", инструкция по включению:"
                          " https://wiki.iarduino.ru/page/raspberry-i2c-spi/")

    def begin(self):
        return self.c_module.begin()

    def changeAddress(self, unsigned char newAddr):
        return self.c_module.changeAddress(newAddr)

    def reset(self):
        return self.c_module.reset()

    def getAddress(self):
        return self.c_module.getAddress()

    def getVersion(self):
        return self.c_module.getVersion()

    def getPullI2C(self):
        return self.c_module.getPullI2C()

    def setPullI2C(self, flag=None):
        if flag is None:
            return self.c_module.getPullI2C(True)
        return self.c_module.getPullI2C(flag)

    def getFrequency(self):
        return self.c_module.getFrequency()

    def setFrequency(self, freq):
        return self.c_module.getFrequency(freq)

    def setCalibration(self, num, tds):
        return self.c_module.setCalibration(num, tds)

    def getKnownTDS(self, num):
        return self.c_module.getKnownTDS(num)

    def setKnownTDS(self, num, tds):
        return self.c_module.setKnownTDS(num, tds)

    def getRd(self):
        return self.c_module.getRd()

    def setRd(self, val):
        return self.c_module.setRd(val)

    def getKd(self):
        return self.c_module.getKd()

    def setKd(self, val):
        return self.c_module.setKd(val)

    def getKt(self):
        return self.c_module.getKt()

    def setKt(self, val):
        return self.c_module.setKt(val)

    def getKp(self):
        return self.c_module.getKp()

    def setKp(self, val):
        return self.c_module.setKp(val)

    def get_T(self):
        return self.c_module.get_T()

    def set_t(self, val):
        return self.c_module.set_t(val)

    def set_T(self, val):
        return self.c_module.set_T(val)

    def getRo(self):
        return self.c_module.getRo()

    def get_S(self):
        return self.c_module.get_S()

    def getEC(self):
        return self.c_module.getEC()

    def getTDS(self):
        return self.c_module.getTDS()
