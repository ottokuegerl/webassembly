#ifndef CREDENTIALS_H
#define CREDENTIALS_H

#include <string>

// ####################################################
// Aruba AP17 SECRET KEY
// Function to return the constant string
// ####################################################
inline const std::string &getAP17_key() {
    static const std::string AP17_key = "VJ2VM4A3NSHUWANG4NQD4XEWBSAEODZN";
    return AP17_key;
}

// ####################################################
// Home Assistant SECRET KEY
// Function to return the constant string
// ####################################################
inline const std::string &getHA_key() {
    static const std::string HA_key = "OR6WECAO2HZLGVQ7RIS2UMWHK6SVRGUK";
    return HA_key;
}

// ####################################################
// WLAN
// Function to return the constant string
// ####################################################
inline const std::string &getWLAN_SSID() {
    static const std::string WLAN_SSID = "Aruba_HPE_WLAN";
    return WLAN_SSID;
}

inline const std::string& getWLAN_PSW() {
    static const std::string WLAN_PSW = "Werner_Plessl_AP303";
    return WLAN_PSW;
}

// ####################################################
// MQTT-server
// Function to return the constant string
// ####################################################
inline const std::string &getMQTT_SRV() {
    static const std::string MQTT_SRV  = "192.168.1.37";
    return MQTT_SRV;
}

inline const std::string &getMQTT_PORT() {
    static const std::string MQTT_PORT  = "1883";
    return MQTT_PORT;
}

inline const std::string &getMQTT_USR() {
    static const std::string MQTT_USR  = "192.168.1.37";
    return MQTT_USR;
}

inline const std::string &getMQTT_PSW() {
    static const std::string MQTT_PSW  = "Werner1307.";
    return MQTT_PSW;
}

// ####################################################
// influxdb ver 2 server
// Function to return the constant string
// ####################################################
inline const std::string &getINFLUXDB_SRV() {
    static const std::string INFLUXDB_SRV  = "192.168.1.37";
    return INFLUXDB_SRV;
}

inline const std::string &getINFLUXDB_PORT() {
    static const std::string INFLUXDB_PORT  = "8086";
    return INFLUXDB_PORT;
}

inline const std::string &getINFLUXDB_TOKEN() {
    static const std::string INFLUXDB_TOKEN  = "SlGyALjLLrR1CoyXqdGAJNmtNafCMfFzjympeNHHTwF64v4kkGLUyke9mFyYcLP7JDwLeaCd-Gms9FKhbBjZcA==";
    return INFLUXDB_TOKEN;
}

inline const std::string &getINFLUXDB_ORG() {
    static const std::string INFLUXDB_ORG  = "virp";
    return INFLUXDB_ORG;
}

inline const std::string &getINFLUXDB_BUCKET() {
    static const std::string INFLUXDB_BUCKET  = "wernerdb";
    return INFLUXDB_BUCKET;
}

#endif // CREDENTIALS_H
