codeunit 85562 ADLSEFakeConfigurationProvTest
{
    Subtype = Test;

    var
        Assert: Codeunit Assert;

    [Test]
    procedure GetSetConfiguration()
    var
        Fake: Codeunit ADLSEFakeConfigurationProvider;
        TestValueCompany: Text;
        TestValueModule: Text;
        TestValueCompanyAndUser: Text;
    begin
        // Act
        Fake.Set('TestKey', 'TestValue', DataScope::Company);

        // Assert
        Assert.IsTrue(Fake.Get('TestKey', DataScope::Company, TestValueCompany), 'Must contain value');
        Assert.AreEqual('TestValue', TestValueCompany, 'Not Equal');

        Assert.IsFalse(Fake.Get('TestKey', DataScope::Module, TestValueModule), 'Must not contain value');
        Assert.IsFalse(Fake.Get('TestKey', DataScope::CompanyAndUser, TestValueCompanyAndUser), 'Must not contain value');
    end;

    [Test]
    procedure ContainsWhenSet_true()
    var
        Fake: Codeunit ADLSEFakeConfigurationProvider;
    begin
        // Act
        Fake.Set('TestKey', 'TestValue', DataScope::CompanyAndUser);

        // Assert
        Assert.IsTrue(Fake.Contains('TestKey', DataScope::CompanyAndUser), 'Does not contain TestKey.');
    end;

    [Test]
    procedure ContainsWhenNotSet_false()
    var
        Fake: Codeunit ADLSEFakeConfigurationProvider;
    begin
        // Assert
        Assert.IsFalse(Fake.Contains('TestKey', DataScope::User), 'Contains TestKey.');
    end;

    [Test]
    procedure DeleteConfiguration()
    var
        Fake: Codeunit ADLSEFakeConfigurationProvider;
    begin
        // Arrange
        Fake.Set('TestKey', 'TestValue', DataScope::Module);
        Fake.Set('TestKey', 'TestValue', DataScope::User);

        // Act
        Fake.Delete('TestKey', DataScope::Module);

        // Assert
        Assert.IsFalse(Fake.Contains('TestKey', DataScope::Module), 'Not deleted.');
        Assert.IsTrue(Fake.Contains('TestKey', DataScope::User), 'Must contain value');
    end;
}