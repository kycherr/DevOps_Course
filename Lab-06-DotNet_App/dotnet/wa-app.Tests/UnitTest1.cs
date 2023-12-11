using System;
using System.Threading.Tasks;
using NUnit.Framework;

namespace wa_app.Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            Assert.Pass();
        }
        [Test]
        public void Test2()
        {
            Assert.True(true);
        }
        [Test]
        public void Test3()
        {
            Assert.False(false);
        }
    }
}