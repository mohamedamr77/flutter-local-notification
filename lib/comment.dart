/*
    steps :
      1- make initialization such as line 14
      2- make  function actionTask and call it in Workmanager().initialize init method
      3- make function regesterMyTask and call it in init method such as line 19
 */
/*
 Workmanager().executeTask((task, inputData) {
      if (kDebugMode) {
        print("Native called background task: $task");
      } //simpleTask will be emitted here.
      return Future.value(true);
    });
 */


/*
    تخيل إنك عندك مجموعة مهام محتاج تشغلها في الخلفية على الموبايل، يعني عايز التطبيق يعمل حاجات وهو مقفول أو شغال في الخلفية، زي مثلاً يبعت إشعار أو يعمل حاجة معينة في وقت محدد.

اللي بيحصل هنا:
init(): ده زي ما تقول هو المفتاح اللي بيشغل Workmanager، بيجهزه عشان يشتغل وبيخليه مستعد يستقبل المهام اللي هتتحطله.

regesterMyTask(): دي بقى وظيفة بتقوم بتسجيل المهمة اللي انت عايزها تتحط في الخلفية. يعني بتقول لـ Workmanager:

"بص يا عم، أنا عندي مهمة اسمها "show simple notification" ومعرفها بـ "id 1"، لو سمحت شغلها لما تحتاج".
actionTask(): دي الحاجة اللي فعلًا هتتنفذ في الخلفية. لما Workmanager يقرر يشغل المهمة اللي سجلتها، هينفذ الكود اللي جوه actionTask.

ليه بنستخدم regesterMyTask؟
لأن من غيرها، Workmanager مش هيبقى عارف هو المفروض يعمل إيه. يعني ببساطة، انت محتاج تقوله "شغللي المهمة دي" عن طريق تسجيلها، وإلا مش هيعمل حاجة من نفسه.

تخيلها كده:
لو عندك عامل في البيت وانت مش موجود، وعايزه يعمل حاجة معينة زي إنه يطفي النور، مش هينفع يقرا أفكارك. لازم تقولله "لما الساعة تيجي 8، روح طفي النور". regesterMyTask هي الطريقة اللي بتقول بيها لـ Workmanager "شغل المهمة دي".

من الآخر، regesterMyTask هي اللي بتسجل المهمة عشان Workmanager يعرف يعمل إيه ومتى. من غيرها، المهمة مش هتشتغل.
     */