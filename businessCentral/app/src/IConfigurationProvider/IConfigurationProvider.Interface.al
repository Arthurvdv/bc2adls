interface IConfigurationProviderADSLE
{
    Access = Internal;

    procedure Get("Key": Text; Scope: DataScope; var Value: Text): Boolean
    procedure TryGet("Key": Text; Scope: DataScope; var Value: Text): Boolean
    procedure Set("Key": Text; Value: Text; Scope: DataScope): Boolean
    procedure Delete("Key": Text; Scope: DataScope): Boolean
    procedure Contains("Key": Text; Scope: DataScope): Boolean
}
