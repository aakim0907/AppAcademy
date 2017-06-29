function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];

  this.name = function() {
    return this.firstName + ' ' + this.lastName;
  };

  this.enroll = function(course) {
    if (this.courses.includes(course)) {
      return;
    } else {
    this.courses.push(course);
    course.addStudent(this);
    }
  };

  this.courseLoad = function() {
    let deptCreds = {};
    this.courses.forEach(course => {
      let dpt = course.dept;
      deptCreds[dpt] = deptCreds[dpt] || 0;
      deptCreds[dpt] += course.creds;
    });
    return deptCreds;
  };
}

function Course(name, dept, creds) {
  this.name = name;
  this.dept = dept;
  this.creds = creds;
  this.students = [];

  this.addStudent = function(student) {
    student.enroll(this);
  };
}


let sally = new Student('sally', 'snowflake');
let waffle = new Student('fake', 'student');
let algernon = new Student('funny', 'name');

let chem = new Course('chemistsss', 'Sci', 5);
let phys = new Course('physucks', 'Sci', 20);
let gym = new Course('standing around', 'Useless', 1);

gym.addStudent(sally);
gym.addStudent(algernon);

waffle.enroll(phys);
waffle.enroll(chem);

// console.log(`sally's course load:`, sally.courseLoad());
// console.log(`alg's course load:`, algernon.courseLoad());
// console.log(`waff's course load:`, waffle.courseLoad());
//
// console.log(`waff's name: ${waffle.name()}`);
//
// console.log(`gym's students:`, gym.students);
