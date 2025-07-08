public class UserTriggerHandler {
public static void handleAfterInsert(List<User> newUsers) {
        // Fetch the Admins group by DeveloperName
        Group adminsGroup = [SELECT Id FROM Group WHERE DeveloperName = 'Admins' AND Type = 'Regular' LIMIT 1];
        if (adminsGroup == null) {
            System.debug('Admins group not found.');
            return;
        }

        List<GroupMember> groupMembersToInsert = new List<GroupMember>();

        for (User user : newUsers) {
            // Check if the user is Active and has the System Administrator profile
            if (user.IsActive && user.Profile.Name == 'System Administrator') {
                GroupMember groupMember = new GroupMember(
                    GroupId = adminsGroup.Id,
                    UserOrGroupId = user.Id
                );
                groupMembersToInsert.add(groupMember);
            }
             }

        // Insert the GroupMembers
        if (!groupMembersToInsert.isEmpty()) {
            insert groupMembersToInsert;
        }
    }
}