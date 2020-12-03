package com.farm.pojo;

public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101900720691";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCCH8bUM7pmwc4GXf7VOegY9A/1FNHaLRYiBI3tFaHnZvfClm5pjW5ilbo7Oj0DCff0d1uSZcgO/75p+wUrAitVj8YHdHEgy1nlIIqkRIhD7fifK2tQfIX+G4Rt9d0QGclNaVff+D4TNNaOC6NdhvrGC8hPCMgxh93pLVHuvW1cjzz6qQyGaowz2ssGy8QKO4Vzbkq/7wmPs8heK8nkJFkWtYIJnTUVcX57uKA3o3xqQLi2Y7mMRiH3sLTxn0g9vrcQrbcu8VFAiQ2BRu+R4Q8e6a3fNPg0KizjPFRzYde+Qor5H0mKJqmEep3qRUOB2QtlcLcw3s99bwS60ts1E3MRAgMBAAECggEAbCmV0JYe/4NhihFf3kYAE53sFcB0n3KSzzwR7Vzp87u3ftwkc0DI3NGwt8K1LG2A2ojMaWiJX05eLSInLZTkCH82EMRNtQDTfI4MMHd2/WA2Jbilv4WCq7Kb5ftVAiktF1fVX6qtjrGBFxm9deTZVv48RtX58pIJd+XgER8MZL7IiT+hnz/Bv9yLWlvnnXD7wuiKarrPOnrxkSmrzA2wnYlE40jJDGp8hgNjEAdoM3g7XsK9dyDlFjPHvuM9e7HNalvc80kD5YvmMU0w0qyxtIilc8WXKSzuiysiLWCj2MX8nLTVrw73ydMuOcpsIhqnBjadWamyWiAucs84qiSLQQKBgQDWXMClJl7XkpygCtNUwqQFd5NS0J6opCPZvnwEm4Y5mpyQhUQrUKxDBk17ErlY22i6nUR35iDwR7hLH7kjWsiRDbwC++CVT0quDunGsjn2HGurJRFxO1QMss4uPQgg25eQo5rAeZ88wDXcyQ5aAXserMWVCbdO1CVRe4VctCiRLQKBgQCbZj+ScepawwxgrKZDNmiFGOB9GR0D57x2bvyIv5QepHvhf8WvT38YYW/9XzZN6dup2n+cNJlEJooaEcISBOTZix/V7P+rigKPp/UzZpdYAy06vbIqefkleIKJuP88xY+j320tj1nibxC9/GzZ6oCBoRbJlDOlQqlk9h36JUZv9QKBgBsjaPw/jFhMZmnYlQKxFaTfi5Y7dSqyhRtnAzpuGiMm0NV3GbdGIljl7l87cp2uQWcGzAlF6DujSNCx9nVkY+oBTCEwlDEy9ahtmOkf3TisRnFHYxrrwOtOo820ylemlVypackeXKuLRgZqqdd5QoYSp30D2uIu936GXc7rvAsNAoGAG0rL43ZqSGJ1LA1mbeuCU83Yr1/XvrXWXZ6Eb6fl5bPRpfsAxxdZJPkH6CHusaRe1efv/YknWdbC7m0r/mopnyNWBgZHqOLmLEC9Sbe84NI+AVELl3YwkaomkvWQriWsYoV88UF58dC7ygIpQ+RxiVK3Y9PJdj7M7VRkU2h0hHkCgYEAqF043o/D39AaVGXFRL8mNA+O6+0a6p7Xbuyed0Ah+k5A1zydiY/PRwRYO0Mk4PO4Rm0Co4BYOZI/jRDGOnRUjESNbS5LDiF4Ipj1zpER1A4PScfqZipcdHnHJmBVmz3Cz4GpSeOX+5wxcpKGjhIP8Mpi07190ZH9S8fx72NdFBs=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt/Ep4Zdtw09BImuAtdZq3Xn6uZMOGZrjf5pvCgXPeQTfTPmV5yj1bEyMU0hRCMFD8KMcLPN3Zp/ruPryl2QypFX1dCboIsMz+egxOA0YV05ft+eiiOulMPBcRuHANaiuVCBGLP8hZmK3HGNBFGMlsTuI9KhdEFODsP0ZjYceAcWYQ+Wz3SWskNNLmZoeKyqp4NJ/V+mbu/OyOYOe/qkrwmjmXnsQFdAO5gZkUvYriqUF61BPn48RbIcpWQasczx1pLJC3p5IdsRwHvfhN84wNOW4SbJpcr303XZkAQhFeXon6XteGRDkUUvAfrzOuw4DhXjJl0Vd8XvTrlCx0Rl/GwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://127.0.0.1:8080/farm_produce_mart/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/farm_produce_mart/paySuccessful";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

}
