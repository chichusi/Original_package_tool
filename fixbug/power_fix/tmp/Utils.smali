.class public Lcom/android/server/biometrics/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BiometricUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static biometricConstantsToBiometricManager(I)I
    .locals 2
    .param p0, "biometricConstantsCode"    # I

    .line 227
    if-eqz p0, :cond_4

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/16 v0, 0xb

    if-eq p0, v0, :cond_2

    const/16 v0, 0xc

    if-eq p0, v0, :cond_1

    const/16 v0, 0xe

    if-eq p0, v0, :cond_2

    const/16 v0, 0xf

    if-eq p0, v0, :cond_0

    .line 245
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unhandled result code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BiometricService"

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    const/4 v0, 0x1

    .local v0, "biometricManagerCode":I
    goto :goto_0

    .line 242
    .end local v0    # "biometricManagerCode":I
    :cond_0
    const/16 v0, 0xf

    .line 243
    .restart local v0    # "biometricManagerCode":I
    goto :goto_0

    .line 239
    .end local v0    # "biometricManagerCode":I
    :cond_1
    const/16 v0, 0xc

    .line 240
    .restart local v0    # "biometricManagerCode":I
    goto :goto_0

    .line 233
    .end local v0    # "biometricManagerCode":I
    :cond_2
    const/16 v0, 0xb

    .line 234
    .restart local v0    # "biometricManagerCode":I
    goto :goto_0

    .line 236
    .end local v0    # "biometricManagerCode":I
    :cond_3
    const/4 v0, 0x1

    .line 237
    .restart local v0    # "biometricManagerCode":I
    goto :goto_0

    .line 229
    .end local v0    # "biometricManagerCode":I
    :cond_4
    const/4 v0, 0x0

    .line 230
    .restart local v0    # "biometricManagerCode":I
    nop

    .line 249
    :goto_0
    return v0
.end method

.method public static combineAuthenticatorBundles(Landroid/os/Bundle;)V
    .locals 4
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 74
    nop

    .line 75
    const-string v0, "allow_device_credential"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 76
    .local v2, "deviceCredentialAllowed":Z
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 79
    const-string v0, "authenticators_allowed"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .local v1, "authenticators":I
    goto :goto_1

    .line 84
    .end local v1    # "authenticators":I
    :cond_0
    if-eqz v2, :cond_1

    .line 85
    const v1, 0x80ff

    goto :goto_0

    .line 86
    :cond_1
    const/16 v1, 0xff

    :goto_0
    nop

    .line 89
    .restart local v1    # "authenticators":I
    :goto_1
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 90
    return-void
.end method

.method private static containsFlag(II)Z
    .locals 1
    .param p0, "haystack"    # I
    .param p1, "needle"    # I

    .line 312
    and-int v0, p0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static getAuthenticationTypeForResult(I)I
    .locals 3
    .param p0, "reason"    # I

    .line 265
    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v1, 0x4

    if-eq p0, v1, :cond_1

    const/4 v1, 0x7

    if-ne p0, v1, :cond_0

    .line 267
    return v0

    .line 274
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported dismissal reason: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 271
    :cond_1
    const/4 v0, 0x2

    return v0
.end method

.method public static getPublicBiometricStrength(I)I
    .locals 1
    .param p0, "authenticators"    # I

    .line 116
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method public static getPublicBiometricStrength(Landroid/os/Bundle;)I
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 126
    nop

    .line 127
    const-string v0, "authenticators_allowed"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 126
    invoke-static {v0}, Lcom/android/server/biometrics/Utils;->getPublicBiometricStrength(I)I

    move-result v0

    return v0
.end method

.method public static isAtLeastStrength(II)Z
    .locals 4
    .param p0, "sensorStrength"    # I
    .param p1, "requestedStrength"    # I

    .line 147
    and-int/lit16 p0, p0, 0x7fff

    .line 150
    not-int v0, p1

    and-int/2addr v0, p0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 151
    return v1

    .line 154
    :cond_0
    const/4 v0, 0x1

    .line 155
    .local v0, "i":I
    :goto_0
    if-gt v0, p1, :cond_2

    .line 156
    const/4 v2, 0x1

    if-ne v0, p0, :cond_1

    .line 157
    return v2

    .line 155
    :cond_1
    shl-int/lit8 v3, v0, 0x1

    or-int/lit8 v0, v3, 0x1

    goto :goto_0

    .line 161
    .end local v0    # "i":I
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown sensorStrength: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", requestedStrength: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "BiometricService"

    invoke-static {v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return v1
.end method

.method public static isBiometricRequested(Landroid/os/Bundle;)Z
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 137
    invoke-static {p0}, Lcom/android/server/biometrics/Utils;->getPublicBiometricStrength(Landroid/os/Bundle;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isCredentialRequested(I)Z
    .locals 1
    .param p0, "authenticators"    # I

    .line 97
    const v0, 0x8000

    and-int/2addr v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isCredentialRequested(Landroid/os/Bundle;)Z
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 105
    const-string v0, "authenticators_allowed"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/android/server/biometrics/Utils;->isCredentialRequested(I)Z

    move-result v0

    return v0
.end method

.method public static isDebugEnabled(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "targetUserId"    # I

    .line 52
    const/4 v0, 0x0

    const/16 v1, -0x2710

    if-ne p1, v1, :cond_0

    .line 53
    return v0

    .line 56
    :cond_0
    sget-boolean v1, Landroid/os/Build;->IS_ENG:Z

    if-nez v1, :cond_1

    sget-boolean v1, Landroid/os/Build;->IS_USERDEBUG:Z

    if-nez v1, :cond_1

    .line 57
    return v0

    .line 60
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "biometric_debug_enabled"

    invoke-static {v1, v2, v0, p1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-nez v1, :cond_2

    .line 63
    return v0

    .line 65
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public static isForeground(II)Z
    .locals 7
    .param p0, "callingUid"    # I
    .param p1, "callingPid"    # I

    .line 281
    const-string v0, "BiometricUtils"

    :try_start_0
    invoke-static {}, Landroid/app/ActivityManager;->getService()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/app/IActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v1

    .line 282
    .local v1, "procs":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    const/4 v2, 0x1

    if-nez v1, :cond_0

    .line 283
    const-string v3, "No running app processes found, defaulting to true"

    invoke-static {v0, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    return v2

    .line 287
    :cond_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 288
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 289
    .local v4, "proc":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v5, p1, :cond_1

    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    if-ne v5, p0, :cond_1

    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v6, 0x7d

    if-gt v5, v6, :cond_1

    .line 291
    return v2

    .line 287
    .end local v4    # "proc":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 296
    .end local v1    # "procs":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v3    # "i":I
    :cond_2
    goto :goto_1

    .line 294
    :catch_0
    move-exception v1

    .line 295
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "am.getRunningAppProcesses() failed"

    invoke-static {v0, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method public static isKeyguard(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "clientPackage"    # Ljava/lang/String;

    .line 301
    const-string v0, "android.permission.USE_BIOMETRIC_INTERNAL"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 304
    .local v0, "hasPermission":Z
    :goto_0
    nop

    .line 305
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x1040226

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 304
    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v3

    .line 306
    .local v3, "keyguardComponent":Landroid/content/ComponentName;
    if-eqz v3, :cond_1

    .line 307
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    .line 308
    .local v4, "keyguardPackage":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_2

    if-eqz v4, :cond_2

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    return v1
.end method

.method public static isUserEncryptedOrLockdown(Lcom/android/internal/widget/LockPatternUtils;I)Z
    .locals 7
    .param p0, "lpu"    # Lcom/android/internal/widget/LockPatternUtils;
    .param p1, "user"    # I

    .line 316
    invoke-virtual {p0, p1}, Lcom/android/internal/widget/LockPatternUtils;->getStrongAuthForUser(I)I

    move-result v0

    .line 317
    .local v0, "strongAuth":I
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/biometrics/Utils;->containsFlag(II)Z

    move-result v2

    .line 318
    .local v2, "isEncrypted":Z
    const/4 v3, 0x2

    invoke-static {v0, v3}, Lcom/android/server/biometrics/Utils;->containsFlag(II)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_1

    const/16 v3, 0x20

    .line 319
    invoke-static {v0, v3}, Lcom/android/server/biometrics/Utils;->containsFlag(II)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v4

    goto :goto_1

    :cond_1
    :goto_0
    move v3, v1

    .line 320
    .local v3, "isLockDown":Z
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "isEncrypted: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, " isLockdown: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "BiometricUtils"

    invoke-static {v6, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    if-nez v2, :cond_3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    move v1, v4

    :cond_3
    :goto_2
    return v1
.end method

.method public static isValidAuthenticatorConfig(I)Z
    .locals 6
    .param p0, "authenticators"    # I

    .line 183
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 184
    return v0

    .line 189
    :cond_0
    const/high16 v1, -0x10000

    .line 191
    .local v1, "testBits":I
    const/high16 v2, -0x10000

    and-int/2addr v2, p0

    const/4 v3, 0x0

    const-string v4, "BiometricService"

    if-eqz v2, :cond_1

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-biometric, non-credential bits found. Authenticators: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    return v3

    .line 199
    :cond_1
    and-int/lit16 v2, p0, 0x7fff

    .line 200
    .local v2, "biometricBits":I
    if-nez v2, :cond_2

    .line 201
    invoke-static {p0}, Lcom/android/server/biometrics/Utils;->isCredentialRequested(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 202
    return v0

    .line 203
    :cond_2
    const/16 v5, 0xf

    if-ne v2, v5, :cond_3

    .line 204
    return v0

    .line 205
    :cond_3
    const/16 v5, 0xff

    if-ne v2, v5, :cond_4

    .line 206
    return v0

    .line 209
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported biometric flags. Authenticators: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return v3
.end method

.method public static isValidAuthenticatorConfig(Landroid/os/Bundle;)Z
    .locals 2
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 172
    const-string v0, "authenticators_allowed"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 173
    .local v0, "authenticators":I
    invoke-static {v0}, Lcom/android/server/biometrics/Utils;->isValidAuthenticatorConfig(I)Z

    move-result v1

    return v1
.end method
