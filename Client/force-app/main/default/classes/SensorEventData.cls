//Class for serializing SensorEvent object
public with sharing class SensorEventData {
    private String SensorEnd {get;set;}
    private Integer xEnd {get;set;}
    private Integer yEnd {get;set;}
    private Integer zEnd {get;set;}
    
    public SensorEventData(String sensorId, Integer x, Integer y, Integer z) {
        this.SensorEnd = sensorId;
        this.xEnd = x;
        this.yEnd = y;
        this.zEnd = z;
    }
    
}