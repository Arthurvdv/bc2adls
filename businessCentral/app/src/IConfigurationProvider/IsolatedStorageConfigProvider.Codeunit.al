codeunit 82577 ADLSEIsolatedStorageConfigProv implements IConfigurationProviderADSLE
{
    Access = Internal;

    procedure Get("Key": Text; Scope: DataScope; var Value: Text): Boolean
    begin
        exit(IsolatedStorage.Get("Key", Scope, Value));
    end;

    procedure TryGet("Key": Text; Scope: DataScope; var Value: Text): Boolean
    begin
        if not IsolatedStorage.Contains("Key", Scope) then
            exit(false);
        exit(IsolatedStorage.Get("Key", Scope, Value));
    end;

    procedure Set("Key": Text; Value: Text; Scope: DataScope): Boolean
    begin
        if EncryptionEnabled() then
            exit(IsolatedStorage.SetEncrypted("Key", Value, Scope))
        else
            exit(IsolatedStorage.Set("Key", Value, Scope));
    end;

    procedure SetEncrypted("Key": Text; Value: Text; Scope: DataScope): Boolean
    begin
        exit(IsolatedStorage.Set("Key", Value, Scope));
    end;

    procedure Delete("Key": Text; Scope: DataScope): Boolean
    begin
        exit(IsolatedStorage.Delete("Key", Scope));
    end;

    procedure Contains("Key": Text; Scope: DataScope): Boolean
    begin
        exit(IsolatedStorage.Contains("Key", Scope));
    end;
}