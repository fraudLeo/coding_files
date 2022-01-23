var lStroage = window.localStorage;
var sStroage = window.sessionStorage;
export default{
    Local:{
        get:function(key){
            return JSON.parse(lStroage.getItem(key) || null)
        },
        set:function(key,val){
            lStroage.setItem(key,JSON.stringify(val))
        },
        remove:function(key){
            lStroage.removeItem(key)
        },
        clear:function(){
            lStroage.clear()
        },
    },
    Session:{
        get:function(key){
            return JSON.parse(sStroage.getItem(key) || null)
        },
        set:function(key,val){
            sStroage.setItem(key,JSON.stringify(val))
        },
        remove:function(key){
            sStroage.removeItem(key)
        },
        clear:function(){
            sStroage.clear()
        }
    }
}