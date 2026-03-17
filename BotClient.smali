# classes13.dex

.class public Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;
.super Ljava/lang/Object;
.source "BotClient.java"


# static fields
.field private static final client:Lokhttp3/OkHttpClient;

.field private static final executor:Ljava/util/concurrent/ExecutorService;

.field public static isPaused:Z

.field private static volatile lastBidTime:J

.field public static orderStatsCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[I>;"
        }
    .end annotation
.end field

.field private static prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->orderStatsCache:Ljava/util/Map;

    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    sput-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->client:Lokhttp3/OkHttpClient;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->executor:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x1

    sput-boolean v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->isPaused:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cacheFromString(Ljava/lang/String;)V
    .registers 8

    .param p0, "cacheString"    # Ljava/lang/String;
    .line 1
    :try_start_0
    const-string v0, "id=([^,]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_12

    .line 3
    return-void

    .line 4
    :cond_12
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 5
    const-string v0, "distance=(\\d+), duration=(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 6
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-nez v7, :cond_2e

    goto :goto_5f

    .line 7
    :cond_2e
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 8
    const/4 v7, 0x2

    invoke-virtual {v0, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 9
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-nez v7, :cond_48

    goto :goto_5f

    .line 10
    :cond_48
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 11
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 12
    :goto_5f
    const/4 v0, 0x4

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v3, v0, v1

    const/4 v1, 0x1

    aput v4, v0, v1

    const/4 v1, 0x2

    aput v5, v0, v1

    const/4 v1, 0x3

    aput v6, v0, v1

    .line 13
    sget-object v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->orderStatsCache:Ljava/util/Map;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_74} :catch_74

    .line 14
    :catch_74
    return-void
.end method

.method public static getCachedStats(Ljava/lang/String;)[I
    .registers 2

    sget-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->orderStatsCache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static checkAndAct(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Ly41/w0;Lu41/p1;)V
    .registers 5
    .param p0, "fragment"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    .param p1, "vm"  # Ly41/w0;
    .param p2, "order"  # Lu41/p1;

    .line 1
    const-string v0, "BotClient"

    const-string v1, "checkAndAct (Fragment) called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->isPaused:Z

    if-eqz v0, :cond_c

    return-void

    :cond_c
    sget-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;

    invoke-direct {v1, p1, p2, p0}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;-><init>(Ly41/w0;Lu41/p1;Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static checkAndAct(Ly41/w0;Lu41/p1;)V
    .registers 5
    .param p0, "vm"  # Ly41/w0;
    .param p1, "order"  # Lu41/p1;

    .line 1
    const-string v0, "BotClient"

    const-string v1, "checkAndAct (VM only) called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->isPaused:Z

    if-eqz v0, :cond_c

    return-void

    :cond_c
    sget-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;-><init>(Ly41/w0;Lu41/p1;Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static getAuthHeaders()[Ljava/lang/String;
    .registers 6

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 2
    const-string v1, "InDrive_Secure_Auth_v2_2026"

    .line 3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 4
    const-string v2, "SHA-256"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 5
    new-instance v2, Ljava/math/BigInteger;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v1, 0x10

    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 6
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v0, v2, v4

    aput-object v1, v2, v3
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    return-object v2

    .line 7
    :catch_3f
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getUserId(Landroid/content/Context;)Ljava/lang/String;
    .registers 7
    .param p0, "context"  # Landroid/content/Context;

    const-string v0, "UserPreferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "user_id"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static handleBlocked(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "message"  # Ljava/lang/String;
    .param p1, "url"  # Ljava/lang/String;

    const/4 v0, 0x1

    sput-boolean v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->isPaused:Z

    invoke-static {}, Lsinet/startup/inDriver/ui/FloatingMenu;->getContext()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_11

    new-instance v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Blocker;

    invoke-direct {v1, p0, p1}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Blocker;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_11
    return-void
.end method

.method public static handleExpired()V
    .registers 2

    const/4 v0, 0x1

    sput-boolean v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->isPaused:Z

    invoke-static {}, Lsinet/startup/inDriver/ui/FloatingMenu;->getContext()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_11

    new-instance v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$ExpiredRunnable;

    invoke-direct {v1}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$ExpiredRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_11
    return-void
.end method

.method public static final performBid(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;D)V
    .registers 5
    .param p0, "fragment"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    .param p1, "price"  # D

    .line 1
    new-instance v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Bidder;

    invoke-direct {v0, p0, p1, p2}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Bidder;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;D)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_e

    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_e
    return-void
.end method

.method public static final performDirectBid(Ly41/w0;D)V
    .registers 10
    .param p0, "viewModel"  # Ly41/w0;
    .param p1, "price"  # D

    .prologue
    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->lastBidTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-gez v2, :cond_16

    const-string v0, "BotClient"

    const-string v1, "Bid rejected due to cooldown (3s)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_16
    sput-wide v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->lastBidTime:J

    const-string v0, "BotClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Performing direct bid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {p0}, Ly41/w0;->getOrderStore()Lo62/j0;

    move-result-object v1

    sget-object v2, Lu41/a0;->a:Lu41/a0;

    invoke-virtual {v1, v2}, Lo62/j0;->n(Ljava/lang/Object;)V

    new-instance v2, Lu41/b0;

    invoke-direct {v2, v0}, Lu41/b0;-><init>(Ljava/math/BigDecimal;)V

    invoke-virtual {v1, v2}, Lo62/j0;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public static final performDirectBidWithTime(Ly41/w0;DLsinet/startup/inDriver/city/common/domain/entity/Price;I)V
    .registers 12
    .param p0, "viewModel"  # Ly41/w0;
    .param p1, "price"  # D
    .param p3, "priceEntity"  # Lsinet/startup/inDriver/city/common/domain/entity/Price;
    .param p4, "minutes"  # I

    .prologue
    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->lastBidTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-gez v2, :cond_16

    const-string v0, "BotClient"

    const-string v1, "Bid rejected due to cooldown (3s)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_16
    sput-wide v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->lastBidTime:J

    const-string v0, "BotClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Performing direct bid with time: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, " Time: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {p0}, Ly41/w0;->getOrderStore()Lo62/j0;

    move-result-object v1

    sget-object v2, Lu41/a0;->a:Lu41/a0;

    invoke-virtual {v1, v2}, Lo62/j0;->n(Ljava/lang/Object;)V

    new-instance v2, Lu41/b0;

    invoke-direct {v2, v0}, Lu41/b0;-><init>(Ljava/math/BigDecimal;)V

    invoke-virtual {v1, v2}, Lo62/j0;->n(Ljava/lang/Object;)V

    move-object v3, v0

    invoke-virtual {p3}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->f()Lsinet/startup/inDriver/city/common/domain/entity/Currency;

    move-result-object v4

    invoke-virtual {p3}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->g()Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {p3}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->d()Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {p3}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->h()Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p3}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->e()Ljava/math/BigDecimal;

    move-result-object p1

    new-instance v2, Lsinet/startup/inDriver/city/common/domain/entity/Price;

    invoke-direct/range {v2 .. v8}, Lsinet/startup/inDriver/city/common/domain/entity/Price;-><init>(Ljava/math/BigDecimal;Lsinet/startup/inDriver/city/common/domain/entity/Currency;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/math/BigDecimal;)V

    move-object p1, v2

    new-instance v2, Lu41/s;

    const/4 v3, 0x1

    invoke-direct {v2, p4, v3, p1}, Lu41/s;-><init>(IZLsinet/startup/inDriver/city/common/domain/entity/Price;)V

    invoke-virtual {v1, v2}, Lo62/j0;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public static sendOrder(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "json"  # Ljava/lang/String;

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->client:Lokhttp3/OkHttpClient;

    const-string v3, "application/json; charset=utf-8"

    invoke-static {v3}, Lokhttp3/MediaType;->e(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v3

    invoke-static {v3, p0}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Ly41/w0;->SERVER_URL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/decide"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v6, v5}, Lokhttp3/Request$Builder;->l(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-static {}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->getAuthHeaders()[Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_48

    const/4 v10, 0x0

    aget-object v10, v9, v10

    const/4 v11, 0x1

    aget-object v11, v9, v11

    if-nez v10, :cond_3b

    goto :goto_48

    :cond_3b
    if-nez v11, :cond_3e

    goto :goto_48

    :cond_3e
    const-string v12, "X-App-Timestamp"

    invoke-virtual {v5, v12, v10}, Lokhttp3/Request$Builder;->a(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    const-string v12, "X-App-Auth"

    invoke-virtual {v5, v12, v11}, Lokhttp3/Request$Builder;->a(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    :cond_48
    :goto_48
    invoke-virtual {v5, v4}, Lokhttp3/Request$Builder;->h(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request$Builder;->b()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v2, v5}, Lokhttp3/OkHttpClient;->a(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Response;->k()Lokhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/ResponseBody;->C()Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v0

    const-string v0, "ConfigDebug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Network Request Time: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "ms. Response: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_84} :catch_85

    return-object v2

    :catch_85
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v1, 0x0

    return-object v1
.end method

.method public static startSession(Landroid/content/Context;)V
    .registers 4
    .param p0, "context"  # Landroid/content/Context;

    const-string v0, "Validando..."

    invoke-static {v0}, Lsinet/startup/inDriver/ui/FloatingMenu;->metrics(Ljava/lang/String;)V

    sget-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Starter;

    invoke-direct {v1, p0}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Starter;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
